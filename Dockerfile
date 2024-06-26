# Dockerfile
FROM python:3.9-slim

ARG APP_VERSION
WORKDIR /app

COPY ${APP_VERSION}/requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY ${APP_VERSION}/app.py app.py
COPY ${APP_VERSION}/templates /app/templates
COPY ${APP_VERSION}/templates/form.html /app/templates/form.html

CMD ["python", "app.py"]
