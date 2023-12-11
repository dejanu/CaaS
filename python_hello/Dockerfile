
# set the base image
FROM python:3-alpine

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip install -r requirements.txt
COPY . /app

# EXPOSE instruction will not actually publish the port: it functions as a type of documentation
EXPOSE 5555

# # baked into the image
ENV FLASK_RUN_PORT=5555

## pass as env var at runtime
# ENV FLASK_RUN_PORT=${FLASK_RUN_PORT}

## change the port at build time
# ARG PORT
# ENV FLASK_RUN_PORT $PORT

CMD ["flask", "run", "--host=0.0.0.0"]

