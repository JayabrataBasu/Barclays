
# requirements_engineering/services/document_service.py
import os
from pathlib import Path
from typing import List, Dict, Optional
import uuid
import shutil
from fastapi import UploadFile

from ..document_processing.parsers.pdf_parser import PDFParser
from ..document_processing.parsers.docx_parser import DocxParser
# Import other parsers as needed

class DocumentService:
    """Service for document processing operations"""
    
    def __init__(self):
        self.parsers = {
            ".pdf": PDFParser(),
            ".docx": DocxParser(),
            # Add other parsers
        }
        self.upload_dir = Path("data/raw")
        self.processed_dir = Path("data/processed")
        
        # Create directories if they don't exist
        self.upload_dir.mkdir(parents=True, exist_ok=True)
        self.processed_dir.mkdir(parents=True, exist_ok=True)
    
    async def save_uploaded_file(self, file: UploadFile) -> Path:
        """Save uploaded file to disk and return file path"""
        # Generate unique filename
        file_extension = os.path.splitext(file.filename)[1].lower()
        unique_filename = f"{uuid.uuid4()}{file_extension}"
        file_path = self.upload_dir / unique_filename
        
        # Save file
        with open(file_path, "wb") as buffer:
            shutil.copyfileobj(file.file, buffer)
            
        return file_path
    
    def extract_text(self, file_path: Path) -> str:
        """Extract text from document using appropriate parser"""
        file_extension = file_path.suffix.lower()
        
        if file_extension in self.parsers:
            return self.parsers[file_extension].parse(file_path)
        else:
            supported_formats = ", ".join(self.parsers.keys())
            raise ValueError(f"Unsupported file format: {file_extension}. Supported formats: {supported_formats}")
    
    async def process_document(self, file: UploadFile) -> Dict:
        """Process uploaded document and extract text"""
        # Save uploaded file
        file_path = await self.save_uploaded_file(file)
        
        # Extract text
        extracted_text = self.extract_text(file_path)
        
        # Store results
        result = {
            "filename": file.filename,
            "file_path": str(file_path),
            "text_length": len(extracted_text),
            "text_preview": extracted_text[:500] + "..." if len(extracted_text) > 500 else extracted_text
        }
        
        return result
