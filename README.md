# Westeros ELT project

This repository contains all the code to create an ELT to apply the knowledge about GCP learned with Datapath. Westeros is a fictitious company with data on a MySQL database and a CSV file stored in a Compute Engine Instance.

# About the infrastructure

- We use `gsutil cp` command to copy the `CSV` file from the instance to the Cloud Storage Bucket.
- Cloud Functions are a serverless solution that, along with Cloud Scheduler, makes a great decision for simple pipelines and allows the company to save money because it will be billed for the function's execution time, and you can keep them as simple as possible. That's why we use them to move our data from cloud storage to the raw dataset in BigQuery and make them accessible to other editors in the project.
- After cleaning the table and denormalizing, we created this [dashboard](https://datastudio.google.com/u/0/reporting/039e5d87-5ab1-4367-a707-44a768e9d5c8/page/t4t8C) with Google Cloud Studio to generate insights about Westeros and its operation.

# Overview

![elt](./images/diagram.png)
