Documentação Técnica: Sistema Automatizado de Classificação Setorial e Auditoria Mercadológica

# 1. Visão Geral do Projeto

# Documentação Técnica: Sistema Automatizado de Classificação Setorial e Auditoria Mercadológica (B3)

▶️ **[Assista aqui ao vídeo de demonstração do ecossistema e roteamento ao vivo](https://www.youtube.com/watch?v=st0XsxZ5tAQ)**

Este sistema automatiza a classificação mercadológica de produtos e inserções comerciais utilizando Inteligência Artificial Multimodal (Visão e Texto). O fluxo opera de forma híbrida, sendo capaz de receber imagens de produtos, links de e-commerce/sites ou transcrições de texto/áudio, cruzando esses dados em tempo real com uma base de dados relacional para devolver a Marca (nome completo do produto), o Segmento oficial e a Justificativa analítica da escolha.

A arquitetura foi projetada sob o padrão OpenAI-Compatible API, o que garante flexibilidade agnóstica de modelo: o sistema pode operar tanto de forma 100% local e privada (On-Premise) sem custos de licenciamento externo, quanto conectado a APIs comerciais em nuvem (OpenAI, Anthropic, Google Gemini, Groq, vLLM ou Azure) através de uma simples alteração de URL e cabeçalho de autenticação.

# 2. Arquitetura e Stack Tecnológico

• Orquestrador de Workflow: n8n (Self-Hosted via Docker)

• Banco de Dados Relacional: PostgreSQL (Armazenamento da taxonomia de segmentos e descrições)

• Motor de Inferência de IA (Agnóstico):

\- Ambiente de Demonstração (Local): KoboldCPP na porta 5001 executando o modelo multimodal Qwen2-VL-7B-Instruct.

\- Ambiente de Produção Corporativo (Alternativo): Compatível com qualquer endpoint REST que siga o padrão /v1/chat/completions (OpenAI GPT-4o, Claude 3.5 Sonnet, Gemini 1.5 Pro, Ollama ou servidores corporativos internos).

# 3. Topologia do Fluxo (Workflow)

O pipeline é composto por 8 nós divididos entre um tronco principal e um desvio condicional para raspagem de dados web (Web Scraping):

1\. When chat message received (Gatilho de Entrada)

2\. Switch (Roteador Condicional)

3\. HTTP Request1 (Raspador Web - Rota 0)

4\. HTML (Extrator e Limpador de Texto - Rota 0)

5\. Code in JavaScript (Unificador de Rotas e Conversor Base64 - Convergência da Rota 0 e Fallback)

6\. Execute a SQL query (Consulta de Taxonomia no PostgreSQL)

7\. HTTP Request (Comunicação via API com o Provedor de IA)

8\. Chat (Nó de Resposta ao Usuário)

# 4. Especificação Detalhada dos Nós (Node-by-Node)

## 4.1. When chat message received (Gatilho)

Responsável por abrir a interface de chat para o usuário enviar instruções, links ou anexar fotos de produtos.

• Make Chat Publicly Available: Desativado (false)

• Options > Allow File Uploads: Ativado (true) — Crítico para permitir o envio de fotos

• Response Mode: Using Response Nodes — Garante que o chat aguarde o processamento final antes de responder

## 4.2. Switch (Roteador de Trânsito)

Analisa a mensagem recebida para decidir se há necessidade de acessar a internet antes de acionar a IA.

• Mode: Rules

• Routing Rule 1:

\- Value 1 (Expression): ={{ \$('When chat message received').first().json.chatInput }}

\- Operador: contains (contém)

\- Value 2: http

• Options > Fallback Output: Extra Output — Cria a saída secundária (Fallback) para mensagens que contêm apenas fotos ou texto puro sem links

## 4.3. HTTP Request1 (Download de Página Web)

Acionado exclusivamente pela Saída 0 do Switch quando um link é detectado.

• Method: GET

• URL (Expression): {{ \$('When chat message received').first().json.chatInput.match(/https?:\\/\\/\[^\\s\]+/)\[0\] }}

\- Nota técnica: Utiliza Expressão Regular (Regex) para isolar e extrair apenas a URL válida da frase digitada.

• Authentication: None

## 4.4. HTML (Filtro de Web Scraping)

Recebe o código-fonte bruto do HTTP Request1 e extrai apenas o texto visível.

• Operation: Extract HTML Content

• Source Data: JSON

• JSON Property: data

• Extraction Values: Key: texto_site, CSS Selector: body, Return Value: Text, Skip Selectors: script, style, nav, footer

## 4.5. Code in JavaScript (Processamento de Imagem e Fallback)

Ponto de convergência do fluxo. Converte arquivos de imagem anexados para matriz Base64.

• Mode: Run Once for All Items

• Language: JavaScript

for (const item of \$input.all()) {  
if (item.binary && item.binary.data0) {  
const buffer = await this.helpers.getBinaryDataBuffer(0, 'data0');  
item.json.foto_base64 = buffer.toString('base64');  
} else {  
item.json.foto_base64 = "";  
}  
}  
return \$input.all();

## 4.6. Execute a SQL query (PostgreSQL)

Consulta a tabela de segmentos setoriais da B3 para alimentar o prompt.

• Operation: Execute Query

• Query: SELECT nome, descricao FROM segmento;

## 4.7. HTTP Request (Integração com Motor de IA / API)

Envia o pacote consolidado para avaliação do modelo LLM/VLM.

• Method: POST

• URL: <http://host.docker.internal:5001/v1/chat/completions> (ou URL da API Externa)

• Authentication: None (Local) ou Bearer Token (Nuvem)

• Send Body: Ativado (true) / Body Content Type: JSON

• Settings: Execute Once ativado

## 4.8. Chat (Resposta Final)

Devolve a análise gerada pela IA para a tela do usuário.

• Operation: Send Message

• Message (Expression): {{ \$json.choices\[0\].message.content }}

# 5. Regras de Negócio e Mecanismos de Blindagem (Troubleshooting)

| Ponto de Atenção                      | Causa Técnica                                                            | Solução Implementada no Projeto                                                     |
| ------------------------------------- | ------------------------------------------------------------------------ | ----------------------------------------------------------------------------------- |
| Limitação de Formato de Imagem (WEBP) | Motores locais não decodificam arquivos .webp.                           | Utilizar arquivos JPEG (.jpg) ou PNG nativos reais ao subir imagens.                |
| Crash por Falta de Imagem             | Modelos multimodais exigem uma string válida na requisição em image_url. | Inserido fallback \|\| 'VemV6aW8=' no JSON para envio de string neutra (1x1 pixel). |
| Quebra de Sintaxe JSON                | Quebras de linha e aspas duplas corrompem a estrutura JSON.              | Texto envelopado pela função nativa JSON.stringify() para higienizar caracteres.    |
| Controle de Alucinação                | Temperatura alta gera categorias inventadas.                             | Temperatura travada em 0.1 no payload para respostas determinísticas.               |
