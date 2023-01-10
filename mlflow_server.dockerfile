FROM python:bullseye

ENV DEBIAN_FRONTEND noninteractive
ENV ACCEPT_EULA=Y

# install dependencies
RUN apt-get update && \
    apt-get install -y build-essential && \
    apt-get install -y wget && \
    apt-get install -y --no-install-recommends curl gcc g++ gnupg unixodbc-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
  
# add SQL Server ODBC Driver
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
  && curl https://packages.microsoft.com/config/debian/11/prod.list > /etc/apt/sources.list.d/mssql-release.list \
  && apt-get update \
  && apt-get install -y --no-install-recommends --allow-unauthenticated msodbcsql18 mssql-tools18 \
  && echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bash_profile \
  && echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bashrc

WORKDIR /

# install miniconda
ENV CONDA_DIR /opt/conda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
     /bin/bash ~/miniconda.sh -b -p /opt/conda

ENV PATH=$CONDA_DIR/bin:$PATH

# install git
RUN apt-get install git

COPY mlflow-2.1.2.dev0-py3-none-any.whl .

# install mlflow and friends
RUN pip install azure-storage-blob azure-identity pyodbc mlflow-2.1.2.dev0-py3-none-any.whl

# clean the install
RUN apt-get -y clean

ENTRYPOINT ["mlflow", "server", "--host", "0.0.0.0"]
