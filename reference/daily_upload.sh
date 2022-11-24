#!/usr/bin/bash

# This script moves the CSV of orderdetails to raw bucket
GS_BUCKET="gs://westeros-dtlk-raw-prod/"
FILE_PATH="/home/andresf.mesad/westeros/daily_files/orderdetails.csv"
echo "[$(date "+%Y-%m-%d %H:%M:%S")] Init"
gsutil cp $FILE_PATH $GS_BUCKET
echo "[$(date "+%Y-%m-%d %H:%M:%S")] Finished"