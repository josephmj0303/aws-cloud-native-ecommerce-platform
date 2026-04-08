aws_region = "us-east-1"
project_name = "e-commerce"
environment = "prod"
ec2_key_name = "my-keypair"
api_ami_id = "ami-01b14b7ad41e17ba4"
admin_ami_id = "ami-01b14b7ad41e17ba4"
api_desired_capacity = 1
admin_desired_capacity = 1
vpc_cidr = "10.0.0.0/16"

public_subnet_cidrs = [
  "10.0.1.0/24",
  "10.0.2.0/24"
]

private_app_subnet_cidrs = [
  "10.0.3.0/24",
  "10.0.4.0/24"
]

private_db_subnet_cidrs = [
  "10.0.5.0/24",
  "10.0.6.0/24"
]

acm_certificate_arn = "arn:aws:acm:us-east-1:622840651636:certificate/8bce2447-51ad-4449-a077-2f97a6dcc81d"
db_name     = "EbookTest"
db_username = "postgres"
db_password = "StrongPassword123"

allowed_ssh_cidr = "157.35.11.230/32"
