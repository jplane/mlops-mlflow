#!/bin/bash

export AZURE_STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol=https;AccountName=[STORAGE-ACCOUNT-NAME];AccountKey=[STORAGE-ACCOUNT-KEY];EndpointSuffix=core.usgovcloudapi.net"
export MLFLOW_BACKEND_STORE_URI="mssql+pyodbc://[SQL-USER]:[SQL-PWD]@[SQL-SERVER-NAME].database.usgovcloudapi.net:1433/mlflowmetadata?driver=ODBC+Driver+18+for+SQL+Server"
export MLFLOW_DEFAULT_ARTIFACT_ROOT="wasbs://artifacts@[STORAGE-ACCOUNT-NAME].blob.core.usgovcloudapi.net/"
export MLFLOW_PORT=5000
export JUPYTER_PORT=8888

docker compose -f compose.cloud.yaml up
