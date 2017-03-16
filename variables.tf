variable "aws_access_key" {
  description = "Access Key of IAM User with sufficient permissions to create Beanstalk Application, provision EC2 instance, create S3 bucket and manager Container Registry"
}

variable "aws_secret_key" {
  description = "Secret Key of IAM User with sufficient permissions to create Beanstalk Application, provision EC2 instance, create S3 bucket and manager Container Registry"
}

variable "application_name" {
  description = "Name of your application"
}

variable "application_description" {
  description = "Sample application based on Elastic Beanstalk & Docker"
}

variable "application_environment" {
  description = "Deployment stage e.g. 'staging', 'production', 'test', 'integration'"
}

variable "region" {
  default     = "us-east-1"
  description = "Defines where your app should be deployed"
}
