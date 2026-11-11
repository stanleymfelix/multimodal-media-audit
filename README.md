Technical Documentation: Automated Sector Classification and Market Audit System

\# Technical Documentation: Automated Sector Classification and Market Audit System

▶️ \*\*\[Click here to watch the live demonstration of the ecosystem and conditional routing\](<https://www.youtube.com/watch?v=st0XsxZ5tAQ)\*\>*

# 1. Project Overview

This system automates the market classification of products and commercial insertions using Multimodal Artificial Intelligence (Vision and Text). The workflow operates in a hybrid architecture, capable of receiving product images, e-commerce/website links, or text/audio transcripts. It cross-references this data in real-time with a relational database to return the Brand (full product name), the official Segment, and the analytical Justification for the choice.

The architecture was designed under the OpenAI-Compatible API standard, ensuring model-agnostic flexibility. The system can operate either 100% locally and privately (On-Premise) with zero external licensing costs, or connected to commercial cloud APIs (OpenAI, Anthropic, Google Gemini, Groq, vLLM, or Azure) through a simple URL and authentication header switch.

# 2. Architecture and Technology Stack

• Workflow Orchestrator: n8n (Self-Hosted via Docker)

• Relational Database: PostgreSQL (Storage of segment taxonomy and descriptions)

• AI Inference Engine (Agnostic):

\- Demonstration Environment (Local): KoboldCPP on port 5001 running the multimodal model Qwen2-VL-7B-Instruct.

\- Corporate Production Environment (Alternative): Compatible with any REST endpoint following the /v1/chat/completions standard (OpenAI GPT-4o, Claude 3.5 Sonnet, Gemini 1.5 Pro, Ollama, or internal corporate servers).

# 3. Workflow Topology

The pipeline consists of 8 nodes divided between a main trunk and a conditional branch for web scraping:

1\. When chat message received (Input Trigger)

2\. Switch (Conditional Router)

3\. HTTP Request1 (Web Scraper - Route 0)

4\. HTML (Text Extractor and Cleaner - Route 0)

5\. Code in JavaScript (Route Unifier and Base64 Converter - Route 0 and Fallback Convergence)

6\. Execute a SQL query (Taxonomy Query in PostgreSQL)

7\. HTTP Request (API Communication with AI Provider)

8\. Chat (User Response Node)

# 4. Detailed Node Specification (Node-by-Node)

## 4.1. When chat message received (Trigger)

Responsible for opening the chat interface for the user to send instructions, links, or attach product photos.

• Make Chat Publicly Available: Disabled (false)

• Options > Allow File Uploads: Enabled (true) — Critical to allow photo uploads.

• Response Mode: Using Response Nodes — Ensures the chat waits for the final processing before responding.

## 4.2. Switch (Traffic Router)

Analyzes the received message to decide if internet access is needed before triggering the AI.

• Mode: Rules

• Routing Rule 1:

\- Value 1 (Expression): ={{ \$('When chat message received').first().json.chatInput }}

\- Operator: contains

\- Value 2: http

• Options > Fallback Output: Extra Output — Creates the secondary output (Fallback) for messages containing only photos or pure text without links.

## 4.3. HTTP Request1 (Web Page Download)

Triggered exclusively by Output 0 of the Switch when a link is detected.

• Method: GET

• URL (Expression): {{ \$('When chat message received').first().json.chatInput.match(/https?:\\/\\/\[^\\s\]+/)\[0\] }}

\- Technical note: Uses Regular Expression (Regex) to isolate and extract only the valid URL from the typed phrase, avoiding protocol errors.

• Authentication: None

## 4.4. HTML (Web Scraping Filter)

Receives the raw source code from HTTP Request1 and extracts only the visible text, optimizing token consumption (API costs or local VRAM memory).

• Operation: Extract HTML Content

• Source Data: JSON

• JSON Property: data

• Extraction Values: Key: texto_site, CSS Selector: body, Return Value: Text, Skip Selectors: script, style, nav, footer

## 4.5. Code in JavaScript (Image Processing and Fallback)

Workflow convergence point (receives connections from both the HTML node and the Fallback output from the Switch). Converts attached image files in the Docker filesystem to a Base64 string.

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

Queries the B3 sectorial segments table to feed the AI prompt with valid business rules.

• Operation: Execute Query

• Query: SELECT nome, descricao FROM segmento;

## 4.7. HTTP Request (AI Engine / API Integration)

Sends the consolidated package (database taxonomy + instruction/text + image) for LLM/VLM evaluation.

• Method: POST

• URL: <http://host.docker.internal:5001/v1/chat/completions> (or External API URL)

• Authentication: None (for local instance) or Header Auth / Bearer Token (for cloud APIs).

• Send Body: Enabled (true) / Body Content Type: JSON

• Settings: Execute Once enabled

## 4.8. Chat (Final Response)

Returns the AI-generated analysis to the user's screen.

• Operation: Send Message

• Message (Expression): {{ \$json.choices\[0\].message.content }}

# 5. Business Rules and Safeguards (Troubleshooting)

| Point of Attention                              | Technical Cause                                                                    | Implemented Solution                                                                                          |
| ----------------------------------------------- | ---------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| Image Format Limitation (WEBP in Local Engines) | Local engines based on C++ do not decode .webp files, silently ignoring the image. | Always use real native JPEG (.jpg) or PNG files when uploading images manually in local instances.            |
| Missing Image Crash (Empty Payload)             | Multimodal models require a valid string in the request for image_url.             | A fallback \|\| 'VemV6aW8=' was inserted into the final JSON for sending a neutral Base64 string (1x1 pixel). |
| JSON Syntax Break (Bad Control Character)       | Line breaks and double quotes corrupt the JSON body structure.                     | The input text is enveloped by the native JSON.stringify() function to sanitize characters.                   |
| Hallucination Control (Temperature 0.1)         | Models with high temperature tend to invent market categories.                     | The temperature was locked at 0.1 in the API payload, forcing deterministic responses.                        |