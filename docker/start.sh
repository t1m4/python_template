#!/bin/bash


if [[ $ENVIRONMENT == "local" ]]; then
    exec python main.py
else
    exec python main.py
fi
