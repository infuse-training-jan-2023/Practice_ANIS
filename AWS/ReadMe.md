# Create an S3 bucket for storing logs 
    - Search for S3 bucket
    - create a new bucket
    - give the name to bucket
    - click on create bucket

# Create a Lambda function to log each invocation with the timestamp to the created S3 bucket.
    - Search for Lamda
    - Give the fuction name
    - select run time and architecture
    - Click on create function

# Create an API in API Gateway and link it to the above created lambda, so that you can invoke the lambda function via curl command/postman or programmatically
    - Added a Trigger with API Gateway
    - made a post request with msg that user likes to pass
    - Gave S3 bucket full access to lamda role
    - now whenever API end-point is hit it triggers the lamda function and create a log in S3 bucket
