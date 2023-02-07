FROM python:3.8-alpine
WORKDIR /flask
COPY ./requirements.txt .
RUN pip install -r requirements.txt
COPY . .
CMD [ "python", "src/main.py" ]
