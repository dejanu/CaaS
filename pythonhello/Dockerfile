FROM python:3-alpine

LABEL org.opencontainers.image.authors="dejanualex@gmail.com"
WORKDIR /app

# bind mount since we don't need requirements
RUN --mount=type=bind,source=requirements.txt,target=/tmp/requirements.txt \
    pip install --no-cache-dir -r  /tmp/requirements.txt

COPY . /app

# EXPOSE instruction will not actually publish the port: it functions as a type of documentation
## baked into the image
#EXPOSE 8888
#ENV FLASK_RUN_PORT=8888

## pass as env var at runtime: docker run 
#ENV FLASK_RUN_PORT=${FLASK_RUN_PORT}

## change the port at build time: docker build
# ARG PORT
ARG PORT=5000
ENV FLASK_RUN_PORT=${PORT}

ENTRYPOINT ["flask"]
CMD ["run", "--host=0.0.0.0"]
