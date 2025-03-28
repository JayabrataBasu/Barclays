# Define base directory
$baseDir = "C:\Users\jayab\Barclays\requirements-engineering-system"

# Function to create directories
function New-Folder($path) {
    if (!(Test-Path $path)) {
        New-Item -ItemType Directory -Path $path -Force | Out-Null
    }
}

# Function to create files
function New-File($filePath, $content = "") {
    if (!(Test-Path $filePath)) {
        New-Item -ItemType File -Path $filePath -Force | Out-Null
        Set-Content -Path $filePath -Value $content
    }
}

# Define folders
$folders = @(
    ".github/workflows",
    "config",
    "data/processed", "data/raw", "data/templates",
    "docs/api", "docs/architecture", "docs/user_guides", "docs/development",
    "logs",
    "notebooks",
    "requirements_engineering/api/routers",
    "requirements_engineering/core",
    "requirements_engineering/db/repositories",
    "requirements_engineering/models/domain",
    "requirements_engineering/models/schemas",
    "requirements_engineering/models/db",
    "requirements_engineering/services",
    "requirements_engineering/nlp/extractors",
    "requirements_engineering/nlp/classifiers",
    "requirements_engineering/nlp/analyzers",
    "requirements_engineering/nlp/prompts",
    "requirements_engineering/document_processing/parsers",
    "requirements_engineering/document_processing/ocr",
    "requirements_engineering/document_processing/preprocessors",
    "requirements_engineering/output_generation/document_generators",
    "requirements_engineering/output_generation/formatters",
    "requirements_engineering/output_generation/templates",
    "requirements_engineering/utils",
    "scripts",
    "tests/test_data/documents", "tests/test_data/expected_outputs",
    "tests/unit/test_document_processing",
    "tests/unit/test_nlp",
    "tests/unit/test_services",
    "tests/unit/test_output_generation",
    "tests/integration/test_api",
    "tests/integration/test_workflows",
    "tests/e2e",
    "ui/public", "ui/src/components", "ui/src/pages", "ui/src/services", "ui/src/utils"
)

# Define files
$files = @(
    ".github/workflows/ci.yml",
    "config/app_config.py",
    "config/logging_config.py",
    "config/model_config.py",
    "data/templates/requirement_doc.docx",
    "data/templates/user_stories.xlsx",
    "notebooks/document_processing_tests.ipynb",
    "notebooks/nlp_experiments.ipynb",
    "notebooks/requirement_extraction_tests.ipynb",
    "requirements_engineering/__init__.py",
    "requirements_engineering/api/__init__.py",
    "requirements_engineering/api/main.py",
    "requirements_engineering/api/dependencies.py",
    "requirements_engineering/api/middleware.py",
    "requirements_engineering/api/routers/__init__.py",
    "requirements_engineering/api/routers/auth.py",
    "requirements_engineering/api/routers/documents.py",
    "requirements_engineering/api/routers/projects.py",
    "requirements_engineering/api/routers/requirements.py",
    "requirements_engineering/core/__init__.py",
    "requirements_engineering/core/security.py",
    "requirements_engineering/core/config.py",
    "requirements_engineering/core/exceptions.py",
    "requirements_engineering/db/__init__.py",
    "requirements_engineering/db/base.py",
    "requirements_engineering/db/session.py",
    "requirements_engineering/db/mongodb.py",
    "requirements_engineering/db/repositories/__init__.py",
    "requirements_engineering/db/repositories/document_repository.py",
    "requirements_engineering/db/repositories/project_repository.py",
    "requirements_engineering/db/repositories/requirement_repository.py",
    "requirements_engineering/models/__init__.py",
    "requirements_engineering/models/domain/__init__.py",
    "requirements_engineering/models/domain/document.py",
    "requirements_engineering/models/domain/project.py",
    "requirements_engineering/models/domain/requirement.py",
    "requirements_engineering/models/schemas/__init__.py",
    "requirements_engineering/models/schemas/document.py",
    "requirements_engineering/models/schemas/project.py",
    "requirements_engineering/models/schemas/requirement.py",
    "requirements_engineering/models/db/__init__.py",
    "requirements_engineering/models/db/document.py",
    "requirements_engineering/models/db/project.py",
    "requirements_engineering/models/db/requirement.py",
    "requirements_engineering/services/__init__.py",
    "requirements_engineering/services/document_service.py",
    "requirements_engineering/services/requirement_service.py",
    "requirements_engineering/services/output_service.py",
    "requirements_engineering/services/version_control_service.py",
    "requirements_engineering/nlp/__init__.py",
    "requirements_engineering/nlp/extractors/__init__.py",
    "requirements_engineering/nlp/extractors/base_extractor.py",
    "requirements_engineering/nlp/extractors/llm_extractor.py",
    "requirements_engineering/nlp/extractors/rule_extractor.py",
    "requirements_engineering/nlp/classifiers/__init__.py",
    "requirements_engineering/nlp/classifiers/functional_classifier.py",
    "requirements_engineering/nlp/classifiers/priority_classifier.py",
    "requirements_engineering/nlp/analyzers/__init__.py",
    "requirements_engineering/nlp/analyzers/gap_analyzer.py",
    "requirements_engineering/nlp/analyzers/quality_analyzer.py",
    "requirements_engineering/nlp/prompts/__init__.py",
    "requirements_engineering/nlp/prompts/extraction_prompts.py",
    "requirements_engineering/nlp/prompts/classification_prompts.py",
    "requirements_engineering/document_processing/__init__.py",
    "requirements_engineering/document_processing/parsers/__init__.py",
    "requirements_engineering/document_processing/parsers/pdf_parser.py",
    "requirements_engineering/document_processing/parsers/docx_parser.py",
    "requirements_engineering/document_processing/parsers/excel_parser.py",
    "requirements_engineering/document_processing/parsers/image_parser.py",
    "requirements_engineering/document_processing/parsers/text_parser.py",
    "requirements_engineering/document_processing/ocr/__init__.py",
    "requirements_engineering/document_processing/ocr/tesseract_ocr.py",
    "requirements_engineering/document_processing/preprocessors/__init__.py",
    "requirements_engineering/document_processing/preprocessors/text_cleaner.py",
    "requirements_engineering/document_processing/preprocessors/normalizer.py",
    "requirements_engineering/utils/__init__.py",
    "requirements_engineering/utils/file_utils.py",
    "requirements_engineering/utils/text_utils.py",
    "requirements_engineering/utils/nlp_utils.py",
    "requirements_engineering/utils/validation_utils.py",
    "scripts/setup_db.py",
    "scripts/generate_test_data.py",
    "scripts/export_requirements.py",
    "tests/__init__.py",
    "tests/conftest.py",
    ".env.example",
    ".gitignore",
    "docker-compose.yml",
    "Dockerfile",
    "pyproject.toml",
    "README.md",
    "setup.py"
)

# Create folders
foreach ($folder in $folders) {
    New-Folder "$baseDir\$folder"
}

# Create files
foreach ($file in $files) {
    New-File "$baseDir\$file"
}

Write-Host "Project structure created successfully!"
