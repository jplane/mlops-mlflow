FROM jupyter/pyspark-notebook:latest

WORKDIR /

COPY mlflow-2.1.2.dev0-py3-none-any.whl .
RUN pip install jupyterlab-git azure-storage-blob azure-identity mlflow-2.1.2.dev0-py3-none-any.whl

WORKDIR /home/jovyan/work

COPY mlflow-example/* .
