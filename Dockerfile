FROM python:3.9
LABEL maintainer="eco@economicus.kr"
LABEL version="1.0.0"
LABEL description="Quant"

ENV PYTHONUNBUFFERED 1

RUN apt-get update && apt-get install -y wget

RUN mkdir /app
COPY . /app
WORKDIR /app

RUN python -m pip install --upgrade pip && \
    pip install -r requirements.txt

RUN wget https://raw.githubusercontent.com/economicus/backend-proto/main/py/quant_pb2.py -O proto/quant_pb2.py && \
		wget https://raw.githubusercontent.com/economicus/backend-proto/main/py/quant_pb2_grpc.py -O proto/quant_pb2_grpc.py

