# STAGE 1: Base image with dependencies
FROM python:3.11-slim as base

COPY requirements.txt .
RUN pip install -r requirements.txt

WORKDIR /app
COPY pyproject.toml poetry.lock README.md ./
COPY run.py src ./

# STAGE 2: Running tests
FROM base as test

# Copy only the files needed for tests
COPY tests tests/

RUN poetry env use system && \
    poetry check && \
    poetry install --no-interaction --no-cache

RUN poetry run python -m pytest

# STAGE 3: Build prod image
FROM base as app

ENV APP_LOG_LEVEL=ERROR

RUN poetry env use system && \
    poetry check && \
    poetry install --only main --no-interaction --no-cache

ENTRYPOINT [ "poetry" ]
CMD [ "run", "python", "-m", "run" ]