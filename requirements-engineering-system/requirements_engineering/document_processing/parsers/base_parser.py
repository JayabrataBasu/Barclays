# requirements_engineering/document_processing/parsers/base_parser.py
from abc import ABC, abstractmethod
from pathlib import Path

class BaseParser(ABC):
    """Base class for all document parsers"""
    
    @abstractmethod
    def parse(self, file_path: Path) -> str:
        """Parse document and return extracted text"""
        pass
        
    @abstractmethod
    def get_supported_extensions(self) -> list[str]:
        """Return list of supported file extensions"""
        pass
