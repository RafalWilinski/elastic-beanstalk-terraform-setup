# Configure AWS Credentials & Region
provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "${var.region}"
}

# S3 Bucket for storing Elastic Beanstalk task definitions
resource "aws_s3_bucket" "ng_beanstalk_deploys" {
  bucket = "${var.application_name}-deployments"
}

# Elastic Container Repository for Docker images
resource "aws_ecr_repository" "ng_container_repository" {
  name = "${var.application_name}"
}

resource "aws_elastic_beanstalk_application" "ng_beanstalk_application" {
  name        = "${var.application_name}"
  description = "${var.application_description}"
}

resource "aws_elastic_beanstalk_environment" "ng_beanstalk_application_environment" {
  name                = "${var.application_name}"
  application         = "${aws_elastic_beanstalk_application.ng_beanstalk_application.name}"
  solution_stack_name = "64bit Amazon Linux 2016.09 v2.5.1 running Docker 1.12.6"
  tier                = "WebServer"

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "t2.micro"
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = "2"
  }
}
