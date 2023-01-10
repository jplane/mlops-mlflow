FROM mcr.microsoft.com/mssql/server:2022-latest

USER root

ENV ACCEPT_EULA="Y"
ENV MSSQL_SA_PASSWORD="Pass_word"

# launch SQL Server
# confirm startup is complete
# create database
# terminate SQL Server
RUN ( /opt/mssql/bin/sqlservr & ) | grep -q "Service Broker manager has started" \
    && /opt/mssql-tools/bin/sqlcmd -S . -U sa -P Pass_word -d master -Q "CREATE DATABASE mlflowartifacts;" \
    && pkill sqlservr
