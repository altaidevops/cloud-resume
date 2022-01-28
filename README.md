# Cloud Resume Challenge
## Creating web cloud resume with AWS Static Website Terraform Module

Terraform module which provision required AWS resources to host a performant and secured static website.

### Features
This Terraform module creates the following AWS resources:

AWS Certificate Manager: wildcard certificate for your domain.
S3
Bucket #1: to store logs.
Bucket #2: to store the content (example.com).
Bucket #3: to redirect a different subdomain to the main domain (e.g., www.example.com redirected to example.com).
CloudFront
Distribution #1: to frontend the website.
Distribution #2: to frontend the subdomain that will be redirected to the main domain.
Route53 record sets pointing to the two CloudFront distributions.
### Requirements
This module is meant for use with Terraform 0.12+. It has not been tested with previous versions of Terraform.
An AWS account and your credentials (aws_access_key_id and aws_secret_access_key) configured. There are several ways to do this (environment variables, shared credentials file, etc.): my preference is to store them in a credential file. More information in the AWS Provider documentation.
Your domain already configured as a hosted zone on Route53.
