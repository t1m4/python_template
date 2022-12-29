#!/bin/bash

mypy .
black . --check
flake8 .
isort . --check-only
autoflake --remove-all-unused-imports --recursive --check  . | grep 'Unused imports/variables detected'