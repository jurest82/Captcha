import boto3


def handler(event, context):

    region = event['Records'][0]['awsRegion']
    bucket_name = event['Records'][0]['s3']['bucket']['name']
    document = event['Records'][0]['s3']['object']['key']

    client = boto3.client('textract', region_name=region)
    response = client.detect_document_text(
        Document={'S3Object': {
            'Bucket': bucket_name,
            'Name': document
        }})

    print(response['Blocks'][1]['Text'])

    return response['Blocks'][1]['Text']
