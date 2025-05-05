
# set the base image
FROM python:3-alpine

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip install -r requirements.txt
COPY . /app

# EXPOSE instruction will not actually publish the port: it functions as a type of documentation
EXPOSE 5000

# ENTRYPOINT ["python3"]
# CMD ["app.py"]

CMD ["python3", "app.py"]

