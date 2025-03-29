# scripts/run_api.py
import uvicorn
import os
import sys

# Add project root to Python path
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

if __name__ == "__main__":
    uvicorn.run("requirements_engineering.api.main:app", host="localhost", port=8000, reload=True)
