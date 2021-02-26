# Install the base requirements for the app.
# This stage is to support development.
FROM python:alpine AS base
COPY /app .
COPY /requirements.txt .
WORKDIR /app
RUN pip install -r requirements.txt

# Extract the static content from the build
# and use a nginx image to serve the content
FROM nginx:alpine
COPY --from=app-zip-creator /app.zip /usr/share/nginx/html/assets/app.zip
COPY --from=build /app/site /usr/share/nginx/html
