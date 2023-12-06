resource "aws_cloudwatch_metric_alarm" "prod-alarm" {
  alarm_name                = "op-observability-cloudwatch-alarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 1
  metric_name               = "OpenSearchClusterUsedSpace"
  namespace                 = "AWS/ES"
  period                    = 60
  statistic                 = "Maximum"
  
  threshold                 = 0.8
  alarm_description         = "This metric monitors opensearch utilization and raises an alarm once the utilization hits 80%"
  actions_enabled           = "true"
  alarm_actions             = "arn:aws:sns:us-east-1:467194453264:Default_CloudWatch_Alarms_Topic"
  ok_actions                = "arn:aws:sns:us-east-1:467194453264:Default_CloudWatch_Alarms_Topic"

  insufficient_data_actions = []

}
