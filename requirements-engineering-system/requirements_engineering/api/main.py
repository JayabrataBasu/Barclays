
# requirements_engineering/api/main.py
from fastapi import FastAPI, UploadFile, File, Form
from fastapi.middleware.cors import CORSMiddleware
import uvicorn
from typing import List, Optional
from .routers import documents  

app = FastAPI(title="Requirements Engineering System")

# CORS middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Restrict in production
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

#include routers
app.include_router(documents.router)

@app.get("/")
def read_root():
    return {"message": "Requirements Engineering System API"}

if __name__ == "__main__":
    uvicorn.run("main:app", host="0.0.0.0", port=8000, reload=True)
