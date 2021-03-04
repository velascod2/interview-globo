# Install the base requirements for the app.
# This stage is to support development.
FROM python:alpine AS base
COPY /src/app /app
COPY /src/app/requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip install -r /app/requirements.txt
EXPOSE 8000 80    

