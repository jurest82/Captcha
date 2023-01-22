import boto3


def handler(event, context):

    region = event['Records'][0]['awsRegion']
    bucket_name = event['Records'][0]['s3']['bucket']['name']
    document = event['Records'][0]['s3']['object']['key']

    textract_client = boto3.client('textract', region_name=region)
    response = textract_client.detect_document_text(
        Document={'S3Object': {
            'Bucket': bucket_name,
            'Name': document
        }})

    with open('/tmp/solution.txt', 'w') as f:
        f.write(f'''{response['Blocks'][1]['Text']}''')

    s3 = boto3.client("s3")
    s3.upload_file('/tmp/solution.txt', bucket_name, 'solutions/solution.txt')
