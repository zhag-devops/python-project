# Python Project Example

This is an example of what a Python project might look like.

## Quick Start

Requirements: python3 and Docker.

To initialize the local development environment, simply run "make install".
Don`t forget to activate virtual environment by run "source .venv/bin/activate"
You can also run "make ci" to execute the code within a Docker container.

## Workflow

Add a package to dev environment
> poetry add package_name --group=dev

Add package to prod environment
> poetry add package_name

## Pre-commit settings

You can install pre-commit by running 'make pre-commit'. The decigion of using pre-commit is up to you!

## Project Details

This project is built using the following tools and libraries:

Build with:
    - [poetry](https://python-poetry.org)
    - [flake8](https://flake8.pycqa.org/en/latest/)
    - [mypy](https://mypy-lang.org/)
    - [pytest](https://docs.pytest.org/en/7.4.x/)
    - [python-json-logger](https://pypi.org/project/python-json-logger/)
    - [docker](https://docs.docker.com/)
    - [pre-commit](https://pre-commit.com/)
