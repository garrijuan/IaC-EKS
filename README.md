**Infraestructure As Code - IaC**

in this repository, we work with infrastructure as code on a kubernetes cluster on AWS, we use two methods: terraform and cloudformation.

_Terraform_ is a standard language to work with infrastructure as code and standardize everything, although we will use our own modules to interact with AWS.

_CloudFormation_ on the other hand is proprietary to AWS and allows us to build infrastructure by applying different stacks within AWS.


## Configure AWS Credentials

Generate Security Credentials using AWS Management Console
Go to Services -> IAM -> Users -> "Your-Admin-User" -> Security Credentials -> Create Access Key
Configure AWS credentials using SSH Terminal on your local desktop

# Configure AWS Credentials in command line
```sh
aws configure
```
AWS Access Key ID:  ...
AWS Secret Access Key: ...
Default region name: us-east-1
Default output format: json

# for example, verify if we are able list S3 buckets 
```sh
aws s3 ls
```
Verify the AWS Credentials Profile
```
cat $HOME/.aws/credentials 
```