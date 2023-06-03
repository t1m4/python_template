#!/bin/bash

mypy .
black .
isort .
ruff --fix .