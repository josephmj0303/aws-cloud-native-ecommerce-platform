output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "alb_dns_name" {
  description = "ALB DNS name"
  value       = aws_lb.main.dns_name
}

output "client_bucket_name" {
  description = "S3 bucket for client frontend"
  value       = aws_s3_bucket.frontend_client.id
}

output "admin_bucket_name" {
  description = "S3 bucket for admin frontend"
  value       = aws_s3_bucket.frontend_admin.id
}

output "client_cloudfront_domain" {
  description = "CloudFront domain for client app"
  value       = aws_cloudfront_distribution.client.domain_name
}

output "admin_cloudfront_domain" {
  description = "CloudFront domain for admin app"
  value       = aws_cloudfront_distribution.admin.domain_name
}

output "rds_endpoint" {
  description = "RDS endpoint"
  value       = aws_db_instance.main.endpoint
}
