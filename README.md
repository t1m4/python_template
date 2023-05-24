# Python template

## Default tools
- Linters and formatters(black, flake8, autoflake, mypy, isort). Add ruff
- Update Dockerfile python version and poetry version 
- Pytest and coverage libraries for testing.
- Sphinx(WIP) - add for documendation. Or any other types of documentation


## Running applications
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
2. Using docker-compose
    ```shell
    docker-compose up app
    ```

## Run tests
 - Using docker-compose
    ```shell
    docker-compose run --rm test
    ```

## Run linters
WARNING: be aware autoflake can delete some important imports. To prevent it use # noqa
- Run only check

    ```shell
    docker-compose run --rm lint-check
    ```
    
- Run linters and modify files

    ```shell
    docker-compose run --rm lint
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
