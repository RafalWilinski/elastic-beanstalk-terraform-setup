# AWS Elastic Beanstalk + Docker Deploy Setup

Purpose of this repo is to document and simplify deployment & setup process of Docker-based applications on AWS Elastic Beanstalk.

### Prerequisities
- AWS IAM Role with access to IAM, EC2, Beanstalk & Elastic Container Registry/Engine and it's access & secret keys. Profile must be set inside `~/.aws/credentials` directory.
- Terraform

### Contents of repo
 - ```Dockerrun.aws.json``` - AWS Beanstalk standard task definition. Tells Beanstalk which image from ECR it should use
 - ```deploy.sh``` - script for deploying applications. App must be first set up
 - ```*.tf``` files - Terraform infrastructure definition written in HCL (HashiCorp Configuration Language)
 - ```clean.sh``` - script for cleaning temporary files

### Setup
1. Run ```terraform plan -out plan.tfplan```
  - Fill out Name, Description & environment
  - Profile is name of your profile inside `~/.aws/credentials` file (Standard AWS way). Default profile is called `default`. You can insert many profiles inside `credentials` file.
2. Run ```terraform apply plan.tfplan``` - this may take up to 15 minutes

Alternatively you can place variables inside `terraform.tfvars` file instead of pasting them into CLI input.

### Rollbacking setup
```
terraform destroy
```

### Manual deployment
```
./deploy.sh <appname> <environment> <region> <commit_sha>
```
For example:
```
./deploy.sh my-app-name staging us-east-1 f0478bd7c2f584b41a49405c91a439ce9d944657
```

If you don't have your AWS credentials set as ENV variables:
```
AWS_ACCOUNT_ID=XX677677XXXX \
AWS_ACCESS_KEY_ID=AKIAIXEXIX5JW5XM6XXX \
AWS_SECRET_ACCESS_KEY=XXXxmxxXlxxbA3vgOxxxxCk+uXXXXOrdmpC/oXxx \
./deploy.sh my-app-name staging us-east-1 f0478bd7c2f584b41a49405c91a439ce9d944657
```

### Automatic deployment
Edit your `circle.yml` file to invoke `deploy.sh` script in `post.test` or `deploy` hook. Don't forget to fill out ENV variables in CircleCI setup.
