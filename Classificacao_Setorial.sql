--
-- PostgreSQL database dump
--

\restrict AKBdyLZPHJH4Uk6f6Dk2gSzGlKnq4BbeEfDFxdidK2BPRoVMiSAbWTKX3KpgqDZ

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-11-11 18:30:52

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 224 (class 1259 OID 16427)
-- Name: segmento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.segmento (
    id integer NOT NULL,
    subsetor_id integer NOT NULL,
    nome character varying(255) NOT NULL,
    descricao text
);


ALTER TABLE public.segmento OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16426)
-- Name: segmento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.segmento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.segmento_id_seq OWNER TO postgres;

--
-- TOC entry 5041 (class 0 OID 0)
-- Dependencies: 223
-- Name: segmento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.segmento_id_seq OWNED BY public.segmento.id;


--
-- TOC entry 220 (class 1259 OID 16399)
-- Name: setor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.setor (
    id integer NOT NULL,
    nome character varying(255) NOT NULL
);


ALTER TABLE public.setor OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16398)
-- Name: setor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.setor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.setor_id_seq OWNER TO postgres;

--
-- TOC entry 5042 (class 0 OID 0)
-- Dependencies: 219
-- Name: setor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.setor_id_seq OWNED BY public.setor.id;


--
-- TOC entry 222 (class 1259 OID 16410)
-- Name: subsetor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subsetor (
    id integer NOT NULL,
    setor_id integer NOT NULL,
    nome character varying(255) NOT NULL
);


ALTER TABLE public.subsetor OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16409)
-- Name: subsetor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subsetor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.subsetor_id_seq OWNER TO postgres;

--
-- TOC entry 5043 (class 0 OID 0)
-- Dependencies: 221
-- Name: subsetor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subsetor_id_seq OWNED BY public.subsetor.id;


--
-- TOC entry 4868 (class 2604 OID 16430)
-- Name: segmento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.segmento ALTER COLUMN id SET DEFAULT nextval('public.segmento_id_seq'::regclass);


--
-- TOC entry 4866 (class 2604 OID 16402)
-- Name: setor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setor ALTER COLUMN id SET DEFAULT nextval('public.setor_id_seq'::regclass);


--
-- TOC entry 4867 (class 2604 OID 16413)
-- Name: subsetor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subsetor ALTER COLUMN id SET DEFAULT nextval('public.subsetor_id_seq'::regclass);


--
-- TOC entry 5035 (class 0 OID 16427)
-- Dependencies: 224
-- Data for Name: segmento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (1, 11, 'Acessorios', 'Empresas que fabricam complementos de moda não classificados como roupas ou calçados, tais como bolsas, cintos, joias, relógios, chapéus e óculos de sol.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (2, 3, 'Acucar e Alcool', 'Usinas sucroalcooleiras especializadas na moagem da cana-de-açúcar para a produção tanto do açúcar (alimento e exportação) quanto de etanol (biocombustível), além de cogeração de energia a partir do bagaço.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (3, 19, 'Agricultura', 'Produtores do agronegócio dedicados diretamente ao plantio, cultivo e colheita de commodities agrícolas primárias (como soja, milho e algodão) para exportação ou abastecimento do mercado interno.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (4, 26, 'Agua e Saneamento', 'Concessionárias públicas ou privadas responsáveis pela captação, tratamento e distribuição da água potável, além do recolhimento, gestão e tratamento sanitário da rede de esgotos municipais.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (5, 25, 'Alimentos', 'Segmento residual para grandes holdings, comercializadoras e atacadistas que integram diferentes vertentes da indústria e do varejo alimentício não cobertos nos nichos específicos.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (6, 3, 'Alimentos Diversos', 'Produtoras e beneficiadoras de alimentos empacotados não associados à proteína animal direta, como massas, biscoitos, óleos vegetais, café, grãos empacotados e ingredientes culinários.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (7, 1, 'Aluguel de carros', 'Companhias conhecidas como locadoras, que compram enormes frotas de automóveis novos para alugá-los a pessoas físicas (turismo/motoristas de aplicativo) e gerenciar a terceirização de frotas de empresas.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (8, 6, 'Armas e Municoes', 'Empresas legalmente autorizadas à fabricação, distribuição e venda de armamentos leves ou pesados, munições, explosivos táticos e acessórios para segurança pública, esporte ou defesa militar.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (9, 20, 'Artefatos de Cobre', 'Voltado para indústrias que beneficiam e transformam o cobre em produtos essenciais para condução elétrica e térmica, como fios, cabos, tubos e ligas especiais.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (10, 20, 'Artefatos de Ferro e Aco', 'Empresas que transformam o aço e o ferro em produtos manufaturados e semi-acabados, como tubos, válvulas, molas, parafusos e componentes metálicos utilizados por diversas cadeias industriais.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (11, 5, 'Atividades Esportivas', 'Clubes de futebol no formato SAF (Sociedade Anônima do Futebol), academias de ginástica e empresas voltadas para a prática esportiva, direitos de transmissão esportiva e gestão de atletas.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (12, 28, 'Automoveis e Motocicletas', 'Montadoras e fabricantes multinacionais focadas na engenharia e fabricação de veículos leves, SUVs e motocicletas destinados aos motoristas finais.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (13, 35, 'Bancos', 'Instituições financeiras tradicionais, comerciais e de investimento, responsáveis por receber depósitos, emitir crédito, gerenciar poupanças e fornecer os principais produtos do sistema bancário.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (14, 5, 'Bicicletas', 'Fabricantes de modais de tração humana (ou com assistência elétrica), fornecendo bicicletas urbanas, mountain bikes, peças e acessórios voltados tanto para mobilidade quanto para práticas esportivas.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (15, 5, 'Brinquedos e Jogos', 'Empresas dedicadas ao entretenimento infantil e adulto por meio de brinquedos educativos, jogos de tabuleiro, colecionáveis e entretenimento recreativo físico.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (16, 11, 'Calcados', 'Indústria de manufatura focada exclusivamente no design, montagem e costura de sapatos, tênis, botas e sandálias, utilizando tanto couro quanto materiais sintéticos e de borracha.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (17, 3, 'Carnes e Derivados', 'Frigoríficos e indústrias de proteína animal focados no abate, processamento, embalagem e exportação de carnes bovina, suína, aviária e pescado, incluindo produtos embutidos.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (18, 7, 'Cervejas e Refrigerantes', 'Indústrias produtoras de bebidas não alcoólicas (refrigerantes, sucos, chás) e bebidas alcoólicas, operando fábricas próprias de envase, destilação e processos de fermentação cervejeira.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (19, 10, 'Computadores e Equipamentos', 'Indústrias fabricantes do hardware, produzindo computadores pessoais, servidores, componentes semicondutores, placas eletrônicas, tablets e infraestruturas físicas de TI.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (20, 22, 'Construcao Pesada', 'Companhias de engenharia e construção civil focadas em grandes obras de infraestrutura, como rodovias, ferrovias, pontes, hidrelétricas e complexos industriais.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (21, 30, 'Corretoras de Seguros e Resseguros', 'Intermediárias focadas exclusivamente na venda consultiva e captação de clientes para os contratos de seguros, ajudando o cliente final a navegar pelas coberturas sem reter o risco nas próprias contas.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (22, 8, 'Distribuicao de Combustiveis', 'Formado por companhias que operam na ponta final da cadeia, focadas na venda direta de combustíveis, lubrificantes e gás para postos de serviços, indústrias e consumidores finais.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (23, 38, 'Eletrodomesticos', 'Compreende as indústrias estritamente focadas na fabricação e montagem de aparelhos elétricos para uso residencial (linhas branca e marrom), como refrigeradores, fogões e máquinas de lavar. Esta classificação diferencia os fabricantes industriais das redes de comércio varejista que apenas revendem os equipamentos ao consumidor final.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (24, 24, 'Eletrodomesticos', 'Indústrias fabricantes da chamada linha branca e linha marrom, produzindo equipamentos elétricos essenciais para as casas, como geladeiras, fogões, micro-ondas, TVs e ar-condicionado.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (25, 34, 'Embalagens', 'Indústrias fabricantes de recipientes e invólucros em diversos materiais (vidro, metal, plástico ou mistos) destinados à conservação, transporte e comercialização de produtos acabados.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (26, 42, 'Energia Eletrica', 'Engloba usinas geradoras (hídricas, eólicas, solares), concessionárias de linhas de transmissão (torres) e distribuidoras que entregam eletricidade para residências e indústrias, além de comercializadoras do mercado livre.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (27, 22, 'Engenharia Consultiva', 'Escritórios especializados que prestam serviços técnicos, elaboração de projetos estruturais, estudos de viabilidade técnica e gestão técnica em grandes projetos e obras civis.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (28, 44, 'Equipamentos', 'Empresas desenvolvedoras de tecnologia e maquinários específicos para a área de saúde, como tomógrafos, monitores de UTI, bisturis elétricos, próteses, seringas e insumos clínico-cirúrgicos hospitalares.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (29, 8, 'Equipamentos e Servicos', 'Composto por fornecedoras de maquinário pesado, tecnologia de perfuração, plataformas e prestadoras de serviços especializados para auxiliar a operação das petroleiras e refinarias.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (30, 40, 'Exploracao de Imoveis', 'Companhias administradoras de shoppings centers, lajes corporativas, galpões logísticos e proprietárias de portfólios imobiliários cujo modelo de negócios visa obter lucros estritamente através da receita de aluguéis e valorização.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (31, 15, 'Exploracao de Rodovias', 'Companhias detentoras de concessões estaduais ou federais encarregadas de administrar, conservar e modernizar o pavimento e a estrutura de estradas pedagiadas.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (32, 8, 'Exploracao Refino e Distribuicao', 'Engloba empresas focadas na extração de petróleo e gás natural de reservatórios, bem como no processo industrial de refino para transformação em derivados (como gasolina, diesel e querosene) e na logística de distribuição em larga escala.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (33, 4, 'Fertilizantes e Defensivos', 'Fabricantes e distribuidores de insumos químicos, biológicos, adubos e defensivos agrícolas (pesticidas e herbicidas) voltados para o aumento da produtividade do setor agropecuário.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (34, 11, 'Fios e Tecidos', 'Indústria têxtil de base, focada no processo de fiação, tecelagem e tingimento, transformando fibras naturais e sintéticas nos tecidos que abastecerão as confecções e a indústria da moda.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (35, 36, 'Gas', 'Companhias especializadas na construção e administração de gasodutos urbanos, entregando gás natural encanado diretamente para consumidores residenciais, pontos comerciais e polos industriais de grande porte.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (36, 14, 'Gestao de Recursos e Investimentos', 'As famosas Asset Managements e gestoras de patrimônio, especializadas em administrar fundos de investimento mobiliário, imobiliário e private equity com o capital de terceiros, visando o rendimento acima do mercado.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (37, 17, 'Holdings Diversificadas', 'Sociedades gestoras cuja única atividade-fim é ser a controladora e dona das ações de um portfólio vasto de empresas de diferentes setores da economia, exercendo gestão estratégica e centralizada do grupo.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (38, 12, 'Hotelaria', 'Redes de hotéis, pousadas, resorts e estadias empresariais que oferecem serviços de acomodação de curta e média duração para turismo de negócios e lazer.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (39, 46, 'Incorporacoes', 'Empresas do mercado imobiliário que atuam desenvolvendo, projetando e viabilizando financeiramente a construção de novos condomínios residenciais, comerciais, prédios e loteamentos para posterior comercialização.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (40, 40, 'Intermediacao Imobiliaria', 'Corretoras e portais de tecnologia que não operam construindo nem sendo donos dos ativos, focando na prestação de serviço em conectar compradores a vendedores e intermediar aluguéis contra o pagamento de comissões.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (41, 15, 'Linhas Aereas de Passageiros', 'Companhias aéreas responsáveis por operar frotas de aviões para transporte comercial e regular de civis, cobrindo rotas domésticas e internacionais em aeroportos estruturados.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (42, 39, 'Madeira', 'Empresas dedicadas ao cultivo florestal, extração e beneficiamento primário de madeira maciça, painéis, chapas e compensados, abastecendo indústrias de móveis e construção civil.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (43, 6, 'Maq e Equip Construcao e Agricolas', 'Produtoras de maquinário pesado sobre rodas ou esteiras, como tratores, colheitadeiras, retroescavadeiras e guindastes, essenciais tanto para o agronegócio quanto para canteiros de obras.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (44, 6, 'Maq e Equip. Industriais', 'Setor dedicado a desenhar, fabricar e vender equipamentos robustos, esteiras, robôs, tornos e linhas de montagem utilizadas dentro de fábricas e parques fabris modernos.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (45, 41, 'Materiais Diversos', 'Segmento residual para indústrias de base que produzem matérias-primas que não se encaixam exclusivamente nas classificações padronizadas de minerais, químicos ou florestais.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (46, 2, 'Material Aeronautico e de Defesa', 'Indústrias de alta tecnologia focadas na fabricação de aeronaves (civis e militares), drones, satélites, mísseis, blindados e prestação de serviços diretos para defesa militar e aeroespacial.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (47, 21, 'Material de Transporte', 'Segmento genérico destinado à indústria de manufatura de partes, peças e componentes suplementares que integram modais de locomoção alternativos ou não padronizados, ou modais secundários.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (48, 2, 'Material Rodoviario', 'Fabricantes de implementos logísticos pesados, como carretas, baús, reboques e carrocerias (ônibus), essenciais para o escoamento de cargas e transporte coletivo via malha rodoviária.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (49, 31, 'Medicamentos e Outros Produtos', 'Focado na ponta logística e comercial da cadeia de saúde, este segmento engloba as grandes redes de farmácias (varejo) e as distribuidoras atacadistas. Diferente dos laboratórios que pesquisam e produzem as fórmulas, estas empresas ganham capilaridade comprando em escala e revendendo remédios, cosméticos e itens de conveniência ao público.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (50, 9, 'Medicamentos e Outros Produtos', 'Laboratórios farmacêuticos dedicados à pesquisa, desenvolvimento, produção química e venda de remédios de prescrição médica, vacinas, genéricos e medicamentos isentos de prescrição.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (51, 29, 'Minerais Metalicos', 'Segmento focado na extração e processamento primário de minérios (como ferro, ouro, bauxita, cobre, entre outros) essenciais para abastecer indústrias siderúrgicas e de transformação em todo o mundo.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (52, 6, 'Motores , Compressores e Outros', 'Companhias que produzem motores estacionários, compressores industriais, bombas e maquinários de tração e propulsão de uso não necessariamente veicular, focados na linha industrial.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (53, 38, 'Moveis', 'Indústrias moveleiras dedicadas à concepção, montagem e venda de mobília em madeira, metal ou plástico para residências, escritórios e parques industriais.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (54, 18, 'Outros', 'Categoria residual, destinada a corporações muito peculiares, fundos ou recebíveis listados que possuem atuação extremamente segmentada e não se enquadram em nenhuma das atividades-fim catalogadas na macroestrutura setorial da bolsa de valores.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (55, 35, 'Outros Intermediarios Financeiros', 'Financeiras de nicho, fintechs de meios de pagamento e cooperativas de crédito que oferecem soluções de empréstimo e liquidação sem a estrutura sistêmica pesada dos grandes bancos de varejo.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (56, 37, 'Outros Titulos', 'Empresas e veículos de investimentos focados em alocações de capital pouco convencionais, títulos públicos especiais ou estruturas financeiras alternativas que fogem ao crédito privado tradicional de mercado.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (57, 39, 'Papel e Celulose', 'Engloba o cultivo de florestas plantadas para a extração de celulose e a fabricação de diferentes tipos de papéis, como papel para imprimir, escrever, embalagens (papelão) e papéis sanitários.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (58, 4, 'Petroquimicos', 'Companhias dedicadas a transformar derivados do refino de petróleo e gás natural em produtos químicos básicos, resinas plásticas e matérias-primas fundamentais para plásticos, tintas e fibras sintéticas.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (59, 5, 'Producao de Eventos e Shows', 'Agências e produtoras que criam, organizam, vendem ingressos e montam toda a estrutura necessária para a execução de megaeventos culturais, shows de música e festivais de entretenimento.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (60, 43, 'Produtos de Cuidado Pessoal', 'Fabricantes de cosméticos, produtos dermatológicos, itens de higiene pessoal e maquiagem voltados para as rotinas de saúde e beleza dos consumidores diretos.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (61, 43, 'Produtos de Limpeza', 'Indústrias focadas em soluções químicas e produtos manufaturados voltados para a higienização de ambientes, como detergentes, desinfetantes e sabão em pó, abrangendo uso doméstico e industrial.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (62, 24, 'Produtos Diversos', 'Produtores ou varejistas generalistas que ofertam bens duráveis ou semiduráveis, cuja demanda é muito atrelada ao poder de compra e expansão do crédito aos consumidores.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (63, 22, 'Produtos para Construcao', 'Empresas que fabricam e comercializam insumos primários e acabados para a construção civil, como cimento, cerâmicas, tintas, vidros e argamassas.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (64, 1, 'Programas de Fidelizacao', 'Empresas que gerenciam coalizões virtuais, moedas de milhagem e cashback, onde os clientes trocam pontos acumulados através de cartões de crédito e varejo por produtos, viagens ou descontos.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (65, 16, 'Programas e Servicos', 'Companhias produtoras de software, desenvolvedoras de sistemas na nuvem (SaaS), consultorias em cibersegurança e integradoras que oferecem inteligência sistêmica e tecnologia intangível para empresas.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (66, 4, 'Quimicos Diversos', 'Reúne indústrias que produzem especialidades químicas, gases industriais e outros compostos não petroquímicos essenciais para tratamento de água, cosméticos, mineração e farmacologia.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (67, 30, 'Resseguradoras', 'Seguradoras das seguradoras, instituições de grande capitalização que pulverizam riscos catastróficos ao aceitarem uma parte da responsabilidade das apólices firmadas pelas seguradoras originais.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (68, 12, 'Restaurante e Similares', 'Operadoras de redes de alimentação fora do lar, fast-foods, bares, lanchonetes e cafeterias voltadas para o atendimento alimentar rápido ou especializado de consumidores em praças comerciais.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (69, 32, 'Securitizadoras de Recebiveis', 'Empresas focadas em adquirir dívidas, recebíveis (como parcelamentos, cheques, dívidas imobiliárias) e empacotá-las na forma de títulos negociáveis que são vendidos no mercado financeiro aos investidores.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (70, 45, 'SEGMENTO', 'DESCRICAO');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (71, 30, 'Seguradoras', 'Instituições que vendem apólices cobrindo variados riscos financeiros, patrimoniais (automóveis, incêndios), de vida ou de saúde, garantindo indenizações frente ao pagamento de prêmios periódicos.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (72, 23, 'Serv Med Hospit Analises e Diagnosticos', 'Operadoras de grandes redes hospitalares, laboratórios de medicina diagnóstica (exames de sangue, imagem e DNA) e clínicas especializadas em prestação direta de cuidados médicos à população.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (73, 15, 'Servicos de Apoio e Armazenagem', 'Empresas gestoras de grandes centros de distribuição, portos secos, terminais alfandegários e armazéns gerais, responsáveis pela estocagem e transbordo logístico antes da entrega final.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (74, 13, 'Servicos Diversos', 'Engloba empresas voltadas à prestação de serviços corporativos (B2B) e administrativos que não se enquadram em infraestrutura ou engenharia pesada. Este segmento reúne prestadoras de soluções especializadas, como certificação digital, serviços de identificação, locação de bens de capital e terceirização de processos de negócios e operacionais.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (75, 33, 'Servicos Diversos', 'Reúne empresas e plataformas de tecnologia que prestam suporte logístico, tecnológico ou de infraestrutura para o funcionamento do mercado financeiro e de capitais. Inclui bolsas de valores, empresas de liquidação, custódia e soluções de meios de pagamento, distinguindo-se dos bancos tradicionais, seguradoras ou fundos de investimento.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (76, 22, 'Servicos Diversos', 'Segmento que reúne companhias de terceirização e gestão operacional, atuando com segurança privada, limpeza, atendimento a clientes, facility management e gestão de resíduos sólidos.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (77, 1, 'Servicos Educacionais', 'Grandes grupos focados em ensino privado, compreendendo universidades, faculdades, colégios de ensino básico, sistemas de ensino, plataformas de ensino a distância (EAD) e cursos profissionalizantes.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (78, 14, 'Servicos Financeiros Diversos', 'Prestadores de serviços complementares do ecossistema financeiro, como empresas de maquininhas de cartão, adquirentes, clearings de liquidação e a própria infraestrutura da Bolsa de Valores.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (79, 20, 'Siderurgia', 'Engloba as usinas que processam minério de ferro e carvão para a produção em larga escala de aço bruto, aços planos, longos e ligas metálicas fundamentais para a construção civil, setor automotivo e linha branca.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (80, 24, 'Tecidos Vestuario e Calcados', 'Varejistas, atacadistas ou produtores de itens de moda, abrangendo tanto a confecção de malhas quanto a distribuição final de roupas, bolsas e calçados em shoppings e lojas de rua.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (81, 27, 'Telecomunicacoes', 'Operadoras e fornecedoras da infraestrutura conectiva, controlando as antenas, satélites, fibras ópticas e redes (como 4G, 5G e banda larga) essenciais para garantir ligações, tráfego de dados móveis e conectividade com a internet.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (82, 15, 'Transporte Ferroviario', 'Concessionárias e operadoras que controlam frotas de locomotivas e vagões rodando sobre malhas de trilhos, com o objetivo principal de movimentar commodities e cargas pesadas por longas distâncias.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (83, 15, 'Transporte Hidroviario', 'Empresas operadoras de navegação de cabotagem, transporte fluvial e marítimo longo-curso, gerenciando frotas de navios de carga, graneleiros e apoio portuário off-shore.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (84, 15, 'Transporte Rodoviario', 'Transportadoras terrestres com grandes frotas de caminhões e vans, focadas em movimentar todo tipo de mercadoria e carga fracionada, interligando indústrias, centros de distribuição e varejistas.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (85, 38, 'Utensilios Domesticos', 'Produtoras de artigos para uso diário em residências que não são aparelhos elétricos, como panelas, talheres, artigos de cama, mesa, banho e decoração em geral.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (86, 11, 'Vestuario', 'Empresas especialistas puramente na confecção e no design de roupas prontas e peças de alfaiataria, atendendo desde boutiques de alto padrão até mercados populares de fast fashion.');
INSERT INTO public.segmento (id, subsetor_id, nome, descricao) VALUES (87, 5, 'Viagens e Turismo', 'Agências de viagem, operadoras de turismo e plataformas digitais focadas em estruturar pacotes turísticos, emissão de passagens, cruzeiros e roteiros guiados de lazer.');


--
-- TOC entry 5031 (class 0 OID 16399)
-- Dependencies: 220
-- Data for Name: setor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.setor (id, nome) VALUES (1, 'Consumo Ciclico');
INSERT INTO public.setor (id, nome) VALUES (2, 'Utilidade Publica');
INSERT INTO public.setor (id, nome) VALUES (3, 'Comunicacoes');
INSERT INTO public.setor (id, nome) VALUES (4, 'Petroleo Gas e Biocombustiveis');
INSERT INTO public.setor (id, nome) VALUES (5, 'Saude');
INSERT INTO public.setor (id, nome) VALUES (6, 'Bens Industriais');
INSERT INTO public.setor (id, nome) VALUES (7, 'Materiais Basicos');
INSERT INTO public.setor (id, nome) VALUES (8, 'Tecnologia da Informacao');
INSERT INTO public.setor (id, nome) VALUES (9, '﻿SETOR');
INSERT INTO public.setor (id, nome) VALUES (10, 'Outros');
INSERT INTO public.setor (id, nome) VALUES (11, 'Financeiro');
INSERT INTO public.setor (id, nome) VALUES (12, 'Consumo nao Ciclico');


--
-- TOC entry 5033 (class 0 OID 16410)
-- Dependencies: 222
-- Data for Name: subsetor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.subsetor (id, setor_id, nome) VALUES (1, 1, 'Diversos');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (2, 6, 'Material de Transporte');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (3, 12, 'Alimentos Processados');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (4, 7, 'Quimicos');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (5, 1, 'Viagens e Lazer');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (6, 6, 'Maquinas e Equipamentos');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (7, 12, 'Bebidas');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (8, 4, 'Petroleo Gas e Biocombustiveis');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (9, 5, 'Medicamentos e Outros Produtos');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (10, 8, 'Computadores e Equipamentos');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (11, 1, 'Tecidos Vestuario e Calcados');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (12, 1, 'Hoteis e Restaurantes');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (13, 6, 'Servicos');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (14, 11, 'Servicos Financeiros Diversos');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (15, 6, 'Transporte');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (16, 8, 'Programas e Servicos');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (17, 11, 'Holdings Diversificadas');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (18, 10, 'Outros');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (19, 12, 'Agropecuaria');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (20, 7, 'Siderurgia e Metalurgia');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (21, 6, 'Comercio Varejista');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (22, 6, 'Construcao e Engenharia');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (23, 5, 'Serv Med Hospit Analises e Diagnosticos');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (24, 1, 'Comercio Varejista');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (25, 12, 'Comercio e Distribuicao');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (26, 2, 'Agua e Saneamento');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (27, 3, 'Telecomunicacoes');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (28, 1, 'Automoveis e Motocicletas');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (29, 7, 'Mineracao');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (30, 11, 'Previdencia e Seguros');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (31, 5, 'Comercio e Distribuicao');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (32, 11, 'Securitizadoras de Recebiveis');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (33, 11, 'Servicos Diversos');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (34, 7, 'Embalagens');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (35, 11, 'Intermediarios Financeiros');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (36, 2, 'Gas');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (37, 11, 'Outros Titulos');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (38, 1, 'Utilidades Domesticas');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (39, 7, 'Madeira e Papel');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (40, 11, 'Exploracao de Imoveis');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (41, 7, 'Materiais Diversos');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (42, 2, 'Energia Eletrica');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (43, 12, 'Produtos de Cuidado Pessoal e de Limpeza');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (44, 5, 'Equipamentos');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (45, 9, 'SUBSETOR');
INSERT INTO public.subsetor (id, setor_id, nome) VALUES (46, 1, 'Construcao Civil');


--
-- TOC entry 5044 (class 0 OID 0)
-- Dependencies: 223
-- Name: segmento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.segmento_id_seq', 87, true);


--
-- TOC entry 5045 (class 0 OID 0)
-- Dependencies: 219
-- Name: setor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.setor_id_seq', 12, true);


--
-- TOC entry 5046 (class 0 OID 0)
-- Dependencies: 221
-- Name: subsetor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subsetor_id_seq', 46, true);


--
-- TOC entry 4878 (class 2606 OID 16437)
-- Name: segmento segmento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.segmento
    ADD CONSTRAINT segmento_pkey PRIMARY KEY (id);


--
-- TOC entry 4880 (class 2606 OID 16439)
-- Name: segmento segmento_subsetor_id_nome_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.segmento
    ADD CONSTRAINT segmento_subsetor_id_nome_key UNIQUE (subsetor_id, nome);


--
-- TOC entry 4870 (class 2606 OID 16408)
-- Name: setor setor_nome_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setor
    ADD CONSTRAINT setor_nome_key UNIQUE (nome);


--
-- TOC entry 4872 (class 2606 OID 16406)
-- Name: setor setor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setor
    ADD CONSTRAINT setor_pkey PRIMARY KEY (id);


--
-- TOC entry 4874 (class 2606 OID 16418)
-- Name: subsetor subsetor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subsetor
    ADD CONSTRAINT subsetor_pkey PRIMARY KEY (id);


--
-- TOC entry 4876 (class 2606 OID 16420)
-- Name: subsetor subsetor_setor_id_nome_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subsetor
    ADD CONSTRAINT subsetor_setor_id_nome_key UNIQUE (setor_id, nome);


--
-- TOC entry 4882 (class 2606 OID 16440)
-- Name: segmento segmento_subsetor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.segmento
    ADD CONSTRAINT segmento_subsetor_id_fkey FOREIGN KEY (subsetor_id) REFERENCES public.subsetor(id);


--
-- TOC entry 4881 (class 2606 OID 16421)
-- Name: subsetor subsetor_setor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subsetor
    ADD CONSTRAINT subsetor_setor_id_fkey FOREIGN KEY (setor_id) REFERENCES public.setor(id);


-- Completed on 2026-11-11 18:30:52

--
-- PostgreSQL database dump complete
--

\unrestrict AKBdyLZPHJH4Uk6f6Dk2gSzGlKnq4BbeEfDFxdidK2BPRoVMiSAbWTKX3KpgqDZ

