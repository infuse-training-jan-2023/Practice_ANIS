import boto3
import datetime
import json

s3 = boto3.client('s3')
bucket_name = 'anismyinfusebucket2'

def lambda_handler(event, context):

    # Get the current timestamp
    now = datetime.datetime.now()
    timestamp = now.strftime('%Y-%m-%d-%H-%M-%S')

    # Log the timestamp to the S3 bucket
    object_key = f'logs/{timestamp}.txt'
    s3.put_object(Bucket=bucket_name, Key=object_key, Body='Lambda invocation at {}.'.format(now))

    return {
        'statusCode': 200,
        'body': 'Log successfully written to S3'
    }
