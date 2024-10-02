FROM python:3-alpine

WORKDIR /app

# bind mount instead since we don't need requirements
RUN --mount=type=bind,source=requirements.txt,target=/tmp/requirements.txt \
    pip install --no-cache-dir -r  /tmp/requirements.txt

COPY . /app

# EXPOSE instruction will not actually publish the port: it functions as a type of documentation
EXPOSE 5000

## baked into the image
#EXPOSE 5555
#ENV FLASK_RUN_PORT=5555

## pass as env var at runtime: docker run 
#ENV FLASK_RUN_PORT=${FLASK_RUN_PORT}

## change the port at build time: docker build
# ARG PORT
#ENV FLASK_RUN_PORT $PORT

ENTRYPOINT ["flask"]
CMD ["run", "--host=0.0.0.0"]
