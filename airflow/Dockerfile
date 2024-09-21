ARG AIRFLOW_VERSION=2.10.0

FROM apache/airflow:${AIRFLOW_VERSION}

# Add apt package
USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    vim \
    gcc \
    heimdal-dev \
    default-jre \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


USER airflow

# It is a good practice to always install the same version of apache-airflow as the one you are using.
RUN pip install --no-cache-dir "apache-airflow==${AIRFLOW_VERSION}" lxml

COPY requirements.txt /requirements.txt

RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir -r /requirements.txt

RUN mkdir -p /opt/airflow/data