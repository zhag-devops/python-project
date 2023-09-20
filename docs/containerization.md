# Containerization

## Docker

> docker build --no-cache --target test  -f Containerfile .

> docker build --no-cache --target app  -f Containerfile .

> docker run python-project                                                                                       

{"name": "__main__", "asctime": "2023-09-20 10:54:05,420", "levelname": "ERROR", "filename": "run.py", "lineno": 23, "process": 1, "message": "Error message"}

> docker run -e APP_LOG_LEVEL=INFO python-project

{"name": "__main__", "asctime": "2023-09-20 10:54:39,063", "levelname": "INFO", "filename": "run.py", "lineno": 21, "process": 1, "message": "Info message"}
{"name": "__main__", "asctime": "2023-09-20 10:54:39,063", "levelname": "WARNING", "filename": "run.py", "lineno": 22, "process": 1, "message": "Warning message"}
{"name": "__main__", "asctime": "2023-09-20 10:54:39,063", "levelname": "ERROR", "filename": "run.py", "lineno": 23, "process": 1, "message": "Error message"}