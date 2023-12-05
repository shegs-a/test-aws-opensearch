resource "aws_opensearch_domain" "example" {
  domain_name    = "logs-observability-prod"
  engine_version = "Elasticsearch_7.10"

  cluster_config {
    instance_type = "r4.large.search"
  }

  ebs_options {
    ebs_enabled = true
    volume_size = 10
  }

  tags = {
    Domain = "OpenSearchTestDomain"
  }
}