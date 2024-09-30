build-custom-airflow-image:
	docker build -t airflow-custom .

create-secret:
	kubectl create secret generic airflow-ssh-git-secret --from-file=gitSshKey=$$HOME/.ssh/id_ed25519 -n airflow

create-deployment-resources:
	kubectl apply -f deployment-resources.yaml

install-airflow-chart: 
	$(MAKE) build-custom-airflow-image
	$(MAKE) create-deployment-resources
	$(MAKE) create-secret
	helm repo add apache-airflow https://airflow.apache.org
	helm repo update
	helm install airflow apache-airflow/airflow -n airflow -f values.yaml --debug

delete-airflow-chart:
	kubectl delete secret airflow-ssh-git-secret -n airflow
	kubectl delete -f deployment-resources.yaml
	helm uninstall airflow -n airflow

update-airflow-chart:
	helm upgrade --install airflow apache-airflow/airflow -n airflow -f values.yaml --debug

