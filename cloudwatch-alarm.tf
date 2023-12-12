resource "aws_cloudwatch_metric_alarm" "prod-alarm" {
  alarm_name                = "${var.env}-alarm"
  comparison_operator       = "LessThanThreshold"
  evaluation_periods        = 1
  metric_name               = "FreeStorageSpace"
  namespace                 = "AWS/ES"

  //EBS clusters are measured in GB, so we take the value inputted in the volume size variable, multiply by 0.2 and then by 1,024 to get the equivalent EBS storage size that equals 20% of the EBS storage
  threshold                 = (var.volume_size*0.2)*1024
  period                    = 60
  statistic                 = "Minimum"
  dimensions = {
    DomainName = var.domain_name
    ClientId   = var.account_id
  }
  alarm_description         = "This metric monitors opensearch utilization and raises an alarm once the utilization hits 80% or when the Free Storage Space goes below 20% of the EBS cluster size"
  actions_enabled           = "true"
  alarm_actions             = ["arn:aws:sns:us-east-1:467194453264:Default_CloudWatch_Alarms_Topic"]
  ok_actions                = ["arn:aws:sns:us-east-1:467194453264:Default_CloudWatch_Alarms_Topic"]

  insufficient_data_actions = []

}