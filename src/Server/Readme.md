
## Run development server
python manage.py runserver_plus --cert-file certificate.crt --key-file private.key

## Run production server

daphne -e ssl:8001:privateKey=private.key:certKey=certificate.crt config.asgi:application
