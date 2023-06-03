#!/bin/bash

mypy .
black . --check
isort . --check-only
ruff check .