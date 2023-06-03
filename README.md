# Python template

Default python template for any project.
## Default tools
- Linters and formatters(black, mypy, isort, ruff).
- Pytest and coverage libraries for testing.
- Sphinx or mkdocs(WIP) - add for documendation.
- Add pre-commit

## Environment variables
1. Environment variables for local start up in .env.example file. Create .env file from example.
2. Environment variables for docker compose in docker-compose.yml file
### List of envorinemt valiables
- ENVIRONMENT - define environment for application

## Installing and Running application
1. Using local shell
    1. Dependencies installation
        - Create shell using poetry
            ```shell
            poetry shell
            ```
        - Install
            ```shell
            poetry install
            ```
    2. Running application
        ```shell
        docker/start.sh
        ```

2. Using docker 
    1. Using docker-compose
        ```shell
        docker-compose up app
        ```
    2. Using Makefile
        ```shell
        make dc-up
        ```
    3. Rebuilding application without cache
        ```shell
        make dc-build
        ```

## Run tests
 - Using docker-compose
    ```shell
    make dc-test
    ```

## Run linters
- Run only check

    ```shell
    make lint-check
    ```
    
- Run linters and modify files

    ```shell
    make lint
    ```


## Docker scripts FAQ
1. Export enviroment variables from .env file 
    ```shell
    source docker/export.sh
    ```
2. Wait for some service
    ```bash
    NAME=Redis HOST=${REDIS_HOST} PORT=${REDIS_PORT} ./docker/wait-for-service.sh
    ```
