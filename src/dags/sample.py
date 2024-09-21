from airflow import DAG
from airflow.operators.bash import BashOperator
from airflow.utils.dates import days_ago

default_args = {
    'owner': 'airflow',
    'start_date': days_ago(1),
    'retries': 1,
}

with DAG(
    'hello_world_dag',
    default_args=default_args,
    description='A simple DAG that prints Hello, World!',
    schedule_interval='@daily', 
) as dag:

    # Define the task using BashOperator
    print_hello = BashOperator(
        task_id='print_hello',
        bash_command='echo "Hello, World!"',
    )

