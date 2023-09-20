# STAGE 1: Base environment
FROM python:3.11-slim as base

COPY requirements.txt .
RUN pip install -r requirements.txt

WORKDIR /app
COPY setup.cfg pyproject.toml poetry.lock README.md ./

# STAGE 2: Development environment 
FROM base as development-environment

RUN poetry env use system && \
    poetry check && \
    poetry install --no-interaction --no-cache

# STAGE 3: Runtime environment
FROM base as runtime-environment

RUN poetry env use system && \
    poetry check && \
    poetry install --only main --no-interaction --no-cache

# STAGE 4: Lint code
FROM development-environment as lint

# Tests covered by linter
COPY tests tests/
COPY src/ run.py ./

RUN poetry run python -m flake8 &&\
    poetry run python -m mypy -m run

# STAGE 5: Running tests
FROM development-environment as test

# Copy only the files needed for tests
COPY tests tests/
COPY src/ run.py ./

RUN poetry run python -m pytest

# STAGE 6: Build prod image
FROM runtime-environment as build

ENV APP_LOG_LEVEL=ERROR

COPY src/ run.py ./

ENTRYPOINT [ "poetry" ]
CMD [ "run", "python", "-m", "run" ]