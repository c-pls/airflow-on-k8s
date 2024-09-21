# ASI

## Installation

```bash
kubectl create namespace airflow

helm repo add apache-airflow https://airflow.apache.org
helm repo update
helm install airflow apache-airflow/airflow --namespace airflow --debug
```

Configure the values.yaml file to your needs.

```bash
helm show values apache-airflow/airflow > values.yaml
```
