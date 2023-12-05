resource "aws_cloudwatch_metric_alarm" "prod-alarm-2" {
  alarm_name                = "op-observability-cloudwatch-alarm-2"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 1
  metric_name               = "OpenSearchClusterUsedSpace"
  namespace                 = "AWS/ES"
  period                    = 60
  statistic                 = "Maximum"
  
  threshold                 = 0.8
  alarm_description         = "This metric monitors opensearch utilization and raises an alarm once the utilization hits 80%"
  actions_enabled           = "true"
  alarm_actions             = [arn:aws:sns:us-east-1:467194453264:Default_CloudWatch_Alarms_Topic:6de8dac7-5bb4-4ac6-81b4-1a722a54b0d3]
  ok_actions                = [arn:aws:sns:us-east-1:467194453264:Default_CloudWatch_Alarms_Topic:6de8dac7-5bb4-4ac6-81b4-1a722a54b0d3]

  insufficient_data_actions = [arn:aws:sns:us-east-1:467194453264:Default_CloudWatch_Alarms_Topic:6de8dac7-5bb4-4ac6-81b4-1a722a54b0d3]

}