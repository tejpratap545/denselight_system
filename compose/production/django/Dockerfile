FROM python:3.8-slim-buster

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1
RUN apt-get update \
    # dependencies for building Python packages
    && apt-get install -y build-essential \
    && apt-get install -y libpq-dev \
    && apt-get install -y gettext \
    # cleaning up unused files
    && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
    && rm -rf /var/lib/apt/lists/*

# upgrade pip
RUN pip install --upgrade pip

# Requirements are installed here to ensure they will be cached.
COPY ./src/Server/requirements /requirements
RUN pip install -r /requirements/base.txt --no-cache
RUN pip install -r /requirements/local.txt --no-cache
RUN pip install -r /requirements/production.txt --no-cache

#copy django start script
COPY ./compose/production/django/start /start
RUN sed -i 's/\r$//g' /start
RUN chmod +x /start

# copy django file
COPY ./src/server /app

WORKDIR /app

ENTRYPOINT ["/entrypoint"]
