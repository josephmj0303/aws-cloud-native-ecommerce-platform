variable "aws_region" {
  description = "AWS region to deploy resources into"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project/application name used in resource names"
  type        = string
  default     = "e-commerce"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "prod"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDRs for public subnets across AZs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_app_subnet_cidrs" {
  description = "CIDRs for private app subnets across AZs"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "private_db_subnet_cidrs" {
  description = "CIDRs for private db subnets across AZs"
  type        = list(string)
  default     = ["10.0.5.0/24", "10.0.6.0/24"]
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to SSH to EC2 instances"
  type        = string
  default     = "0.0.0.0/0"
}

variable "acm_certificate_arn" {
  description = "ACM certificate ARN for ALB HTTPS"
  type        = string
}

variable "api_instance_type" {
  description = "Instance type for API backend ASG"
  type        = string
  default     = "t3.micro"
}

variable "api_ami_id" {
  description = "AMI for API backend instances"
  type        = string
}

variable "ec2_key_name" {
  description = "Optional EC2 key pair name"
  type        = string
  default     = null
}

variable "db_username" {
  description = "Master username for RDS"
  type        = string
}

variable "db_password" {
  description = "Master password for RDS"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Initial database name"
  type        = string
  default     = "EbookTest"
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "RDS allocated storage in GB"
  type        = number
  default     = 20
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}
