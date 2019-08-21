resource "aws_kinesis_stream" "default" {
  name                = var.kinesis_stream_name
  shard_count         = var.shard_count
  retention_period    = var.retention_period
  shard_level_metrics = var.shard_level_metrics
  encryption_type     = var.encryption_type
  kms_key_id          = var.kms_key_id
  tags                = var.tags
}

resource "aws_cloudwatch_metric_alarm" "read_throughput_exceeded" {
  count               = var.create_read_throughput_alarm == true ? 1 : 0
  alarm_name          = var.read_throughput_exceeded_name
  comparison_operator = var.read_throughput_comparison_operator
  evaluation_periods  = var.read_throughput_evaluation_periods
  metric_name         = var.read_throughput_metric_name
  namespace           = var.read_throughput_namespace
  period              = var.read_throughput_period
  statistic           = var.read_throughput_statistic
  threshold           = var.read_throughput_threshold
  alarm_description   = var.read_throughput_alarm_description
  treat_missing_data  = var.read_throughput_treat_missing_data
  dimensions          = var.read_throughput_dimensions
  alarm_actions       = var.read_throughput_alarm_actions
}

resource "aws_cloudwatch_metric_alarm" "write_throughput_exceeded" {
  count               = var.create_write_throughput_alarm == true ? 1 : 0
  alarm_name          = var.write_throughput_exceeded_name
  comparison_operator = var.write_throughput_comparison_operator
  evaluation_periods  = var.write_throughput_evaluation_periods
  metric_name         = var.write_throughput_metric_name
  namespace           = var.write_throughput_namespace
  period              = var.write_throughput_period
  statistic           = var.write_throughput_statistic
  threshold           = var.write_throughput_threshold
  alarm_description   = var.write_throughput_alarm_description
  treat_missing_data  = var.write_throughput_treat_missing_data
  dimensions          = var.write_throughput_dimensions
  alarm_actions       = var.write_throughput_alarm_actions
}

resource "aws_sns_topic" "sns_topic" {
  count = var.create_sns_topic == true ? 1 : 0
  name  = var.sns_topic_name
}

resource "aws_sns_topic_subscription" "lambda" {
  count     = var.create_sns_topic_subscription == true ? 1 : 0
  topic_arn = aws_sns_topic.sns_topic[0].arn
  protocol  = "lambda"
  endpoint  = var.lambda_endpoint
}