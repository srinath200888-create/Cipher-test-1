---
name: python-ai
description: Use when building AI/ML applications with Python. Covers RAG pipelines, LLM integration, vector databases, embeddings, and LangChain/LlamaIndex workflows. Trigger keywords: AI, ML, RAG, LLM, LangChain, embedding, vector database, Ollama, local model
---

# Python AI/ML Development

## RAG Pipeline Architecture
```
Document → Chunking → Embedding → Vector DB
                                        ↓
User Query → Embedding → Semantic Search → Retrieved Chunks
                                                ↓
                                        LLM → Response
```

## Local LLMs with Ollama
```bash
# Install Ollama
winget install Ollama.Ollama

# Pull models
ollama pull llama3.2          # 3B params, fast, good for chat
ollama pull nomic-embed-text  # Embedding model
ollama pull mistral           # 7B params, strong general model

# Run
ollama run llama3.2
```

## LangChain Workflow
```python
from langchain_ollama import OllamaLLM, OllamaEmbeddings
from langchain_chroma import Chroma
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain.chains import RetrievalQA

# Load and chunk
splitter = RecursiveCharacterTextSplitter(chunk_size=512, chunk_overlap=50)
chunks = splitter.split_documents(documents)

# Embed and store
embeddings = OllamaEmbeddings(model="nomic-embed-text")
vectordb = Chroma.from_documents(chunks, embeddings)

# Query
llm = OllamaLLM(model="llama3.2")
qa = RetrievalQA.from_chain_type(llm, retriever=vectordb.as_retriever())
response = qa.invoke("What is this document about?")
```

## Vector Database Selection
| DB | Best For | Setup |
|----|----------|-------|
| ChromaDB | Prototyping, local | `pip install chromadb` |
| Qdrant | Production, self-hosted | Docker or cloud |
| Milvus | Scale, distributed | Kubernetes |
| pgvector | Already using PostgreSQL | `CREATE EXTENSION vector` |

## Embedding Models
- **OpenAI**: `text-embedding-3-small` (1536d, best quality)
- **Local**: `nomic-embed-text` (768d, good quality)
- **Local**: `all-MiniLM-L6-v2` (384d, fast, decent)

## FastAPI + LLM Endpoint
```python
from fastapi import FastAPI
from pydantic import BaseModel
from ollama import chat

app = FastAPI()

class Query(BaseModel):
    prompt: str

@app.post("/chat")
async def chat_endpoint(query: Query):
    response = chat(model="llama3.2", messages=[{"role": "user", "content": query.prompt}])
    return {"response": response["message"]["content"]}
```

## Streaming Responses
```python
from fastapi.responses import StreamingResponse

@app.post("/chat/stream")
async def chat_stream(query: Query):
    async def generate():
        stream = chat(model="llama3.2", messages=[{"role": "user", "content": query.prompt}], stream=True)
        for chunk in stream:
            yield f"data: {chunk['message']['content']}\n\n"
    return StreamingResponse(generate(), media_type="text/event-stream")
```
