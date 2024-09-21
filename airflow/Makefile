update-airflow-chart:
	helm upgrade --install airflow apache-airflow/airflow -n airflow -f values.yaml --debug

build-custom-airflow-image:
	docker build -t airflow-custom .