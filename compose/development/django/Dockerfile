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

COPY ./compose/development/django/start /start
RUN sed -i 's/\r$//g' /start
RUN chmod +x /start

COPY ./compose/development/django/celery/worker/start /start-celeryworker
RUN sed -i 's/\r$//g' /start-celeryworker
RUN chmod +x /start-celeryworker

COPY ./compose/development/django/celery/beat/start /start-celerybeat
RUN sed -i 's/\r$//g' /start-celerybeat
RUN chmod +x /start-celerybeat

COPY ./compose/development/django/celery/flower/start /start-flower
RUN sed -i 's/\r$//g' /start-flower
RUN chmod +x /start-flower

COPY ./compose/production/django/entrypoint /entrypoint
RUN sed -i 's/\r$//g' /entrypoint
RUN chmod +x /entrypoint


WORKDIR /app

ENTRYPOINT ["/entrypoint"]
