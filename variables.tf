variable "versionES" {
  type = string
  description = "The ElasticSearch version to be setup for this OpenSearch cluster"
}

variable "instance_type" {
  type = string
  description = "Type of Instance to be deployed for this OpenSearch cluster"
}

variable "instance_count" {
  type = number
  description = "Number of instances in this OpenSeach cluster"
}

variable "domain_name" {
  type = string
  description = "Domain Name of the OpenSearch Cluster"
}

variable "volume_size" {
  type = number
  description = "Sets the size of the EBS to be used by the OpenSearch cluster"
}