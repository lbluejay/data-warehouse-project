import os
import pandas as pd
from google.cloud import bigquery

# Initialize BigQuery client
client = bigquery.Client()
dataset_id = f"{os.getenv('GCP_PROJECT_ID')}.{os.getenv('GCP_DATASET')}"

# Create dataset if it doesn't exist
client.create_dataset(dataset_id, exists_ok=True)

data_path = "./data"
for file in os.listdir(data_path):
    if file.endswith(".csv"):
        table_name = file.replace("olist_", "").replace("_dataset.csv", "")
        file_path = os.path.join(data_path, file)
        
        print(f"Loading {file} into {dataset_id}.{table_name}...")
        
        df = pd.read_csv(file_path)
        
        # Load to BigQuery
        job_config = bigquery.LoadJobConfig(write_disposition="WRITE_TRUNCATE")
        job = client.load_table_from_dataframe(df, f"{dataset_id}.{table_name}", job_config=job_config)
        job.result()  # Wait for the job to complete

print("All tables loaded successfully!")