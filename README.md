# Financial Tracker - Serverless and Event-driven Implementation on AWS

## Pre-requisites

- terraform cli
- aws cli
- AWS SSO profile configured

## Installation

```
$ terraform init

$ terraform validate

# Login via AWS SSO
$ aws sso login --profile iam-gen-cli-user && export AWS_DEFAULT_PROFILE=iam-gen-cli-user

$ terraform plan

$ terraform apply
```

## Clean up

To destroy the stack:

```
$ terraform destroy
```
