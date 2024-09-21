build-custom-airflow-image:
	docker build -t airflow-custom .

create-secret:
	kubectl create secret generic airflow-ssh-git-secret --from-file=gitSshKey=$$HOME/.ssh/id_ed25519 -n airflow

create-configmap:
	kubectl apply -f config-map.yaml -n airflow

install-airflow-chart: 
	$(MAKE) create-secret
	$(MAKE) create-configmap
	helm repo add apache-airflow https://airflow.apache.org
	helm repo update
	helm install airflow apache-airflow/airflow -n airflow -f values.yaml --debug

update-airflow-chart:
	helm upgrade --install airflow apache-airflow/airflow -n airflow -f values.yaml --debug

