# requirements_engineering/api/routers/documents.py
from fastapi import APIRouter, UploadFile, File, Form, HTTPException
from typing import List, Optional
import os

from ...services.document_service import DocumentService

router = APIRouter(prefix="/documents", tags=["Documents"])
document_service = DocumentService()

@router.post("/upload")
async def upload_documents(
    files: List[UploadFile] = File(...),
    project_name: str = Form(...),
    additional_context: Optional[str] = Form(None)
):
    """Upload and process multiple documents"""
    results = []
    
    for file in files:
        # Validate file extension
        file_extension = os.path.splitext(file.filename)[1].lower()
        if file_extension not in [".pdf", ".docx", ".doc", ".txt"]:
            raise HTTPException(
                status_code=400, 
                detail=f"Unsupported file format: {file_extension}. Supported formats: .pdf, .docx, .doc, .txt"
            )
        
        # Process document
        try:
            result = await document_service.process_document(file)
            results.append(result)
        except Exception as e:
            raise HTTPException(status_code=500, detail=f"Error processing file {file.filename}: {str(e)}")
    
    return {
        "message": f"Successfully processed {len(results)} documents",
        "project_name": project_name,
        "additional_context": additional_context,
        "results": results
    }

