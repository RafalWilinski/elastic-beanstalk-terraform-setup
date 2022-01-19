variable "profile" {
  description = "Name of your profile inside ~/.aws/credentials"
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

variable "instance_type" {
  default     = "t2.micro"
  description = "Defines the EC2 instance type"
}

variable "autoscaling_max_size" {
  default     = "2"
  type        = string
  description = "Defines the maximum autoscaling number of instances"
}