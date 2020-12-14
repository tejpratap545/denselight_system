FROM python:3.8-slim-buster

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

# upgrade pip
RUN pip install --upgrade pip

# Requirements are installed here to ensure they will be cached.
COPY ./src/Server/requirements /requirements
RUN pip install -r /requirements/base.txt --no-cache
RUN pip install -r /requirements/local.txt --no-cache
RUN pip install -r /requirements/production.txt --no-cache


COPY ./compose/django/start /start
RUN sed -i 's/\r$//g' /start
RUN chmod +x /start


WORKDIR /app
