FROM python:3.7-alpine
WORKDIR /code
ENV FLASK_APP=hello_app
ENV FLASK_RUN_HOST=0.0.0.0
COPY . /code
RUN pip install -r requirements.txt
EXPOSE 5000
COPY . .
CMD ["flask", "run"]