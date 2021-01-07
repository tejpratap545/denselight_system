FROM nginx:alpine

RUN rm /etc/nginx/conf.d/default.conf
COPY ./compose/development/nginx/nginx.conf /etc/nginx/conf.d
COPY ./compose/development/nginx/ssl /etc/ssl
