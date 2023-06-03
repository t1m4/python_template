#!make
.DEFAULT_GOAL := dc-test

# Makefile target args
args = $(filter-out $@,$(MAKECMDGOALS))


# cmds
lint-check:
	./docker/lint-check.sh

lint:
	./docker/lint.sh

# docker cmds
dc-up:
	HOST=$(hostname) docker compose up -d app

dc-build:
	HOST=$(hostname) docker compose build --no-cache app

dc-stop:
	HOST=$(hostname) docker compose stop app

dc-down:
	HOST=$(hostname) docker compose down

dc-delete-volumes:
	HOST=$(hostname) docker compose down --volumes

dc-logs:
	HOST=$(hostname) docker compose logs -f $(args)

dc-test: dc-up
	HOST=$(hostname) docker compose exec app pytest --no-cov -s $(args)

dc-poetry-add: dc-up-app
	HOST=$(hostname) docker compose exec app poetry  add $(args)

clean:
	rm -rf `find . -name __pycache__`
	rm -f `find . -type f -name '*.py[co]' `
	rm -f `find . -type f -name '*~' `
	rm -f `find . -type f -name '.*~' `
	rm -rf dist *.egg-info
	rm -rf .cache
	rm -rf .pytest_cache
	rm -rf .mypy_cache
	rm -rf .ruff_cache
	rm -rf htmlcov
	rm -f .coverage
	rm -f .coverage.*