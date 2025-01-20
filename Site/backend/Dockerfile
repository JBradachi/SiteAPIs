FROM python:3.9-alpine

WORKDIR /app

RUN pip install requests
RUN pip install flask
RUN pip install mysql-connector-python

COPY . . 

CMD [ "python3",  "app.py" ]