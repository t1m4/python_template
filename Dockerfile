FROM python:3.10-bullseye as base

ENV PYTHONUNBUFFERED 1

RUN pip install poetry==1.2.2

WORKDIR /app

COPY pyproject.toml poetry.lock /app/

RUN poetry export --without-hashes --with dev --output=requirements.txt
RUN pip install -r requirements.txt

COPY . /app

ENTRYPOINT ["docker/start.sh"]
