#!/bin/bash

mkdir -p ~/.aws
echo "[default]" > ~/.aws/credentials
echo "aws_access_key_id=$AWS_ACCESS_KEY_ID" >> ~/.aws/credentials
echo "aws_secret_access_key=$AWS_SECRET_ACCESS_KEY" >> ~/.aws/credentials
echo "[default]" > ~/.aws/config
echo "region=$AWS_DEFAULT_REGION" >> ~/.aws/config
echo "output=$AWS_DEFAULT_OUTPUT" >> ~/.aws/config
sudo mkdir -p /root/.aws
sudo cp -r ~/.aws/* /root/.aws/
