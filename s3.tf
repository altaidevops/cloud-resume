## S3
# Creates bucket to store logs
resource "aws_s3_bucket" "website_logs" {
  bucket = "${var.website-domain-main}-logs"
  acl    = "log-delivery-write"

  # Comment the following line if you are uncomfortable with Terraform destroying the bucket even if this one is not empty
  force_destroy = true


  tags = merge(var.tags, {
    ManagedBy = "terraform"
    Changed   = formatdate("YYYY-MM-DD hh:mm ZZZ", timestamp())
  })

  lifecycle {
    ignore_changes = [tags["Changed"]]
  }
}

# Creates bucket to store the static website
resource "aws_s3_bucket" "website_root" {
  bucket = "${var.website-domain-main}-root"
  acl    = "public-read"

  # Comment the following line if you are uncomfortable with Terraform destroying the bucket even if not empty
  force_destroy = true

  logging {
    target_bucket = aws_s3_bucket.website_logs.bucket
    target_prefix = "${var.website-domain-main}/"
  }

  website {
    index_document = "index.html"
    error_document = "404.html"
  }

  tags = merge(var.tags, {
    ManagedBy = "terraform"
    Changed   = formatdate("YYYY-MM-DD hh:mm ZZZ", timestamp())
  })

  lifecycle {
    ignore_changes = [tags["Changed"]]
  }
}

