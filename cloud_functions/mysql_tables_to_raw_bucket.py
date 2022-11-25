import os
from sqlalchemy import create_engine
import pymysql
from google.cloud import secretmanager, storage
import pandas as pd
from datetime import datetime

TABLES = ['customers', 'employees', 'offices',
          'orders', 'payments', 'productlines', 'products']


def move_mysql_to_raw(request):
    # Get secret from secret manager
    secret_client = secretmanager.SecretManagerServiceClient()
    secret_name = "classicmodels-read-only-connection-string"
    project_id = "westeros-project"
    resource = {
        "name": f"projects/{project_id}/secrets/{secret_name}/versions/latest"}
    response = secret_client.access_secret_version(resource)
    connection_string = response.payload.data.decode("UTF-8")
    if connection_string:
        print(f"Secret - success")

    # Create connection with db and generate csv
    print("Now at db connection")
    db_connection = create_engine(connection_string)
    with db_connection.begin() as connection:
        for table in TABLES:
            print(f"Dumping {table}")
            if table == 'products':
                query = f"SELECT * FROM {table};"
            else:
                query = """
                SELECT 
                productCode,
                productName,
                productLine,
                productScale,
                productVendor,
                quantityInStock,
                buyPrice,
                MSRP
                FROM products;
                """
            df = pd.read_sql(sql=query, con=connection)
            storage_client = storage.Client()
            bucket = storage_client.get_bucket('westeros-dtlk-raw-prod')
            today = datetime.now().strftime('%Y-%m-%d')
            file_name = f"{table}_{today}.csv"
            bucket.blob(file_name).upload_from_string(
                df.to_csv(index=False, encoding='utf-8'), 'text/csv')
            print(f"Done with {table}")
    return 'success - check logs'
