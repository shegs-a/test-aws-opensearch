resource "aws_cloudwatch_metric_alarm" "prod-alarm" {
  alarm_name                = "${var.env}-alarm"
  comparison_operator       = "LessThanThreshold"
  evaluation_periods        = 1
  metric_name               = "FreeStorageSpace"
  namespace                 = "AWS/ES"
  threshold                 = 0.2
  period                    = 60
  statistic                 = "Minimum"
  dimensions = {
    DomainName = var.domain_name
    ClientId   = var.account_id
  }
  alarm_description         = "This metric monitors opensearch utilization and raises an alarm once the utilization hits 80%"
  actions_enabled           = "true"
  alarm_actions             = ["arn:aws:sns:us-east-1:467194453264:Default_CloudWatch_Alarms_Topic"]
  ok_actions                = ["arn:aws:sns:us-east-1:467194453264:Default_CloudWatch_Alarms_Topic"]

  insufficient_data_actions = []

}