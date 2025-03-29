# tests/unit/test_document_processing/test_pdf_parser.py
import os
import pytest
from pathlib import Path

from requirements_engineering.document_processing.parsers.pdf_parser import PDFParser

def test_pdf_parser_extracts_text():
    # Create test directory if it doesn't exist
    test_dir = Path("C:\Users\jayab\Downloads\Comprehensive Implementation Blueprint.pdf")
    test_dir.mkdir(parents=True, exist_ok=True)
    
    # Path to test PDF
    test_pdf_path = test_dir / "Comprehensive Implementation Blueprint.pdf"
    
    # Skip test if file doesn't exist
    if not test_pdf_path.exists():
        pytest.skip(f"Test file {test_pdf_path} not found")
    
    # Parse PDF
    parser = PDFParser()
    extracted_text = parser.parse(test_pdf_path)
    
    # Verify text was extracted
    assert extracted_text
    assert len(extracted_text) > 0
