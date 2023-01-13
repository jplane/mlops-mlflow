#!/bin/bash

export AZURE_STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol=http;AccountName=devstoreaccount1;AccountKey=Eby8vdM02xNOcqFlqUwJPLlmEtlCDXJ1OUzFT50uSRZ6IFsuFq2UVErCz4I6tq/K1SZFPTOtr/KBHBeksoGMGw==;BlobEndpoint=http://azurite:10000/devstoreaccount1;"
export MLFLOW_BACKEND_STORE_URI="mssql+pyodbc://sa:Pass_word@sqlserver:1433/mlflowartifacts?driver=ODBC+Driver+18+for+SQL+Server&TrustServerCertificate=yes"
export MLFLOW_DEFAULT_ARTIFACT_ROOT="wasbs://artifacts@azurite/"
export MLFLOW_PORT=5000
export JUPYTER_PORT=8888

docker compose -f compose.cloud.yaml -f compose.local.yaml up
