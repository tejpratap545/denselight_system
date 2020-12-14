# Dockerfile
FROM node:12.18.3-alpine


COPY ./compose/development/nuxt/start /start
RUN sed -i 's/\r$//g' /start
RUN chmod +x /start


WORKDIR /app
