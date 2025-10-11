import mlflow

mlflow.set_experiment("DummyExp")
with mlflow.start_run():
    mlflow.log_param("param1", 123)
    mlflow.log_metric("metric1", 0.99)
    print("Logged dummy experiment to MLflow.")
