FROM python:3.7-alpine
WORKDIR /app
#  copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

ENV FLASK_APP=hello_app
ENV FLASK_RUN_HOST=0.0.0.0

COPY . /app
RUN pip install -r requirements.txt
EXPOSE 5000
COPY . .
CMD ["flask", "run"]