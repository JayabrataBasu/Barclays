# Requirements Engineering System

This project is a comprehensive system for managing requirements engineering processes. It includes components for document processing, NLP-based requirement extraction, API services, and output generation.

## Project Folder Structure

```plaintext
requirements-engineering-system/
├── .github/                          # GitHub workflows and CI/CD configurations
│   └── workflows/
│       └── ci.yml
├── config/                            # Configuration files
│   ├── app_config.py                  # Application configuration
│   ├── logging_config.py              # Logging configuration
│   └── model_config.py                # AI model configuration
├── data/                              # Data storage (not version controlled)
│   ├── processed/                     # Processed data
│   ├── raw/                           # Raw input data
│   └── templates/                     # Document templates
│       ├── requirement_doc.docx       # Word template for requirements
│       └── user_stories.xlsx          # Excel template for user stories
├── docs/                              # Documentation
│   ├── api/                           # API documentation
│   ├── architecture/                  # Architecture diagrams
│   ├── user_guides/                   # User guides
│   └── development/                   # Development guides
├── logs/                              # Application logs
├── notebooks/                         # Jupyter notebooks for prototyping
│   ├── document_processing_tests.ipynb
│   ├── nlp_experiments.ipynb
│   └── requirement_extraction_tests.ipynb
├── requirements_engineering/           # Main application package
│   ├── __init__.py
│   ├── api/                           # API layer
│   │   ├── __init__.py
│   │   ├── main.py                    # FastAPI application
│   │   ├── dependencies.py            # API dependencies
│   │   ├── middleware.py              # API middleware
│   │   └── routers/                   # API endpoints
│   │       ├── __init__.py
│   │       ├── auth.py                # Authentication routes
│   │       ├── documents.py           # Document upload/processing routes
│   │       ├── projects.py            # Project management routes
│   │       └── requirements.py        # Requirements management routes
│   ├── core/                          # Core application logic
│   │   ├── __init__.py
│   │   ├── security.py                # Security utilities
│   │   ├── config.py                  # Configuration management
│   │   └── exceptions.py              # Custom exceptions
│   ├── db/                            # Database layer
│   │   ├── __init__.py
│   │   ├── base.py                    # SQLAlchemy base
│   │   ├── session.py                 # Database session management
│   │   ├── mongodb.py                 # MongoDB connection
│   │   └── repositories/              # Data access repositories
│   │       ├── __init__.py
│   │       ├── document_repository.py
│   │       ├── project_repository.py
│   │       └── requirement_repository.py
│   ├── models/                        # Data models
│   │   ├── __init__.py
│   │   ├── domain/                    # Domain models
│   │   │   ├── __init__.py
│   │   │   ├── document.py
│   │   │   ├── project.py
│   │   │   └── requirement.py
│   │   ├── schemas/                   # Pydantic schemas for API
│   │   │   ├── __init__.py
│   │   │   ├── document.py
│   │   │   ├── project.py
│   │   │   └── requirement.py
│   │   └── db/                        # SQLAlchemy ORM models
│   │       ├── __init__.py
│   │       ├── document.py
│   │       ├── project.py
│   │       └── requirement.py
│   ├── services/                      # Business logic services
│   │   ├── __init__.py
│   │   ├── document_service.py        # Document processing service
│   │   ├── requirement_service.py     # Requirement extraction service
│   │   ├── output_service.py          # Output generation service
│   │   └── version_control_service.py # Version control service
│   ├── nlp/                           # NLP components
│   │   ├── __init__.py
│   │   ├── extractors/                # Requirement extractors
│   │   │   ├── __init__.py
│   │   │   ├── base_extractor.py
│   │   │   ├── llm_extractor.py       # LLM-based extraction
│   │   │   └── rule_extractor.py      # Rule-based extraction
│   │   ├── classifiers/               # Requirement classifiers
│   │   │   ├── __init__.py
│   │   │   ├── functional_classifier.py
│   │   │   └── priority_classifier.py
│   │   ├── analyzers/                 # Text analyzers
│   │   │   ├── __init__.py
│   │   │   ├── gap_analyzer.py        # Gap detection
│   │   │   └── quality_analyzer.py    # Quality assessment
│   │   └── prompts/                   # LLM prompts
│   │       ├── __init__.py
│   │       ├── extraction_prompts.py
│   │       └── classification_prompts.py
│   ├── document_processing/           # Document processing components
│   │   ├── __init__.py
│   │   ├── parsers/                   # Document parsers
│   │   │   ├── __init__.py
│   │   │   ├── pdf_parser.py
│   │   │   ├── docx_parser.py
│   │   │   ├── excel_parser.py
│   │   │   ├── image_parser.py
│   │   │   └── text_parser.py
│   │   ├── ocr/                       # OCR components
│   │   │   ├── __init__.py
│   │   │   └── tesseract_ocr.py
│   │   └── preprocessors/             # Text preprocessors
│   │       ├── __init__.py
│   │       ├── text_cleaner.py
│   │       └── normalizer.py
│   ├── output_generation/             # Output generation components
│   │   ├── __init__.py
│   │   ├── document_generators/       # Document generators
│   │   │   ├── __init__.py
│   │   │   ├── word_generator.py
│   │   │   └── excel_generator.py
│   │   ├── formatters/                # Output formatters
│   │   │   ├── __init__.py
│   │   │   ├── requirement_formatter.py
│   │   │   └── user_story_formatter.py
│   │   └── templates/                 # Template engines
│   │       ├── __init__.py
│   │       └── jinja_engine.py
│   └── utils/                         # Utility functions
│       ├── __init__.py
│       ├── file_utils.py
│       ├── text_utils.py
│       ├── nlp_utils.py
│       └── validation_utils.py
├── scripts/                           # Utility scripts
│   ├── setup_db.py                    # Database setup script
│   ├── generate_test_data.py          # Test data generation
│   └── export_requirements.py         # Standalone export script
├── tests/                             # Test suite
│   ├── __init__.py
│   ├── conftest.py                    # Test configuration
│   ├── test_data/                     # Test data files
│   │   ├── documents/                 # Sample documents for testing
│   │   └── expected_outputs/          # Expected test outputs
│   ├── unit/                           # Unit tests
│   │   ├── __init__.py
│   │   ├── test_document_processing/
│   │   ├── test_nlp/
│   │   ├── test_services/
│   │   └── test_output_generation/
│   ├── integration/                   # Integration tests
│   │   ├── __init__.py
│   │   ├── test_api/
│   │   └── test_workflows/
│   └── e2e/                            # End-to-end tests
│       ├── __init__.py
│       └── test_full_process.py
├── ui/                                # Frontend (if applicable)
│   ├── public/
│   └── src/
│       ├── components/
│       ├── pages/
│       ├── services/
│       └── utils/
│           ├── .env.example           # Example environment variables
├── .gitignore                         # Git ignore file
├── docker-compose.yml                 # Docker Compose configuration
├── Dockerfile                          # Docker configuration
├── pyproject.toml                     # Project metadata and dependencies
├── README.md                          # Project documentation
└── setup.py                           # Package installation script


## Getting Started

1. Clone the repository.
2. Install dependencies using `pip install -r requirements.txt` or `poetry install`.
3. Configure environment variables using `.env.example`.
4. Run the application using Docker or locally.

## Features

- Document processing with OCR and parsers.
- NLP-based requirement extraction and classification.
- API services for managing requirements and projects.
- Output generation in Word and Excel formats.
- Comprehensive test suite for unit, integration, and end-to-end testing.

## License

This project is licensed under the MIT License.
