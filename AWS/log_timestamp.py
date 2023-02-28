import boto3
import datetime
import json

s3 = boto3.client('s3')
bucket_name = 'infusebucket'

def append_content_to_file(content):
    s3 = boto3.resource('s3')
    file_name = 'Get_logs.txt'

    # Get the existing file content
    obj = s3.Object(bucket_name, file_name)
    file_content = obj.get()['Body'].read().decode('utf-8')

    # Append the new content to the existing content
    updated_content = file_content + content + " Lambda logged at: " + str(datetime.datetime.now()) + "\n"

    # Write the updated content back to the file
    obj.put(Body=updated_content)

def lambda_handler(event, context):

    # Get the current timestamp
    now = datetime.datetime.now()
    timestamp = now.strftime('%Y-%m-%d-%H-%M-%S')
    
    content = json.loads(event['body'])
    append_content_to_file(content['msg'])

    # Log the timestamp to the S3 bucket
    object_key = f'logs/{timestamp}.txt'
    s3.put_object(Bucket=bucket_name, Key=object_key, Body='Lambda invocation at {}.'.format(now))

    return {
        'statusCode': 200,
        'body': 'Log successfully written to S3'
    }
