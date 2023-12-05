resource "aws_cloudwatch_metric_alarm" "prod-alarm" {
  alarm_name                = "op-observability-cloudwatch-alarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 2
  metric_name               = "OpenSearchUtilization"
  namespace                 = "AWS/ES"
  period                    = 28800
  statistic                 = "Average"
  threshold                 = 0.80
  alarm_description         = "This metric monitors opensearch utilization and raises an alarm once the utilization hits 80%"
  insufficient_data_actions = []
}