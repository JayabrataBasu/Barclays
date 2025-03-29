# requirements_engineering/document_processing/parsers/pdf_parser.py
from pathlib import Path
import PyPDF2
from .base_parser import BaseParser

class PDFParser(BaseParser):
    """Parser for PDF documents"""
    
    def parse(self, file_path: Path) -> str:
        """Extract text from PDF file"""
        text = ""
        with open(file_path, "rb") as file:
            reader = PyPDF2.PdfReader(file)
            for page in reader.pages:
                text += page.extract_text() + "\n\n"
        return text
    
    def get_supported_extensions(self) -> list[str]:
        return [".pdf"]

