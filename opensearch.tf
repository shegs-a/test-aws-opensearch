resource "aws_opensearch_domain" "example" {
  domain_name    = var.domain_name
  engine_version = var.versionES

  encrypt_at_rest {
    enabled = true
  }
  
  cluster_config {
    instance_type = var.instance_type
    instance_count = var.instance_count
  }

  ebs_options {
    ebs_enabled = true
    volume_size = var.volume_size
    volume_type = "gp2"
  }

  tags = {
    Domain = "OpenSearchTestDomain"
  }
}