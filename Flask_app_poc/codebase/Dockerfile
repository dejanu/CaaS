FROM python:3.8-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

ENV FLASK_APP main.py
ENV FLASK_RUN_HOST=localhost

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]