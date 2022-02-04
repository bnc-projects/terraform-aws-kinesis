locals {
  kinesis_comparison_operator = "GreaterThanThreshold"
  kinesis_namespace           = "AWS/Kinesis"
  kinesis_treat_missing_data  = "notBreaching"
  kinesis_dimensions          = {
    StreamName = var.kinesis_stream_name
  }
}

resource "aws_kinesis_stream" "default" {
  name                = var.kinesis_stream_name
  shard_count         = var.shard_count
  stream_mode_details = {
    stream_mode       = var.stream_mode
  }
  retention_period    = var.retention_period
  shard_level_metrics = var.shard_level_metrics
  encryption_type     = var.encryption_type
  kms_key_id          = var.kms_key_id
  tags                = var.tags
}

resource "aws_cloudwatch_metric_alarm" "read_throughput_exceeded" {
  alarm_name          = format("%s-read-throughput-exceeded", var.kinesis_stream_name)
  comparison_operator = local.kinesis_comparison_operator
  evaluation_periods  = var.read_throughput_evaluation_periods
  metric_name         = "ReadProvisionedThroughputExceeded"
  namespace           = local.kinesis_namespace
  period              = var.read_throughput_period
  statistic           = var.read_throughput_statistic
  threshold           = var.read_throughput_threshold
  alarm_description   = format("Alarm when %s stream read throughput exceeded", var.kinesis_stream_name)
  treat_missing_data  = local.kinesis_treat_missing_data
  dimensions          = local.kinesis_dimensions
  alarm_actions       = var.alarm_actions
  tags                = var.tags
}

resource "aws_cloudwatch_metric_alarm" "write_throughput_exceeded" {
  alarm_name          = format("%s-write-throughput-exceeded", var.kinesis_stream_name)
  comparison_operator = local.kinesis_comparison_operator
  evaluation_periods  = var.write_throughput_evaluation_periods
  metric_name         = "WriteProvisionedThroughputExceeded"
  namespace           = local.kinesis_namespace
  period              = var.write_throughput_period
  statistic           = var.write_throughput_statistic
  threshold           = var.write_throughput_threshold
  alarm_description   = format("Alarm when %s stream write throughput exceeded", var.kinesis_stream_name)
  treat_missing_data  = local.kinesis_treat_missing_data
  dimensions          = local.kinesis_dimensions
  alarm_actions       = var.alarm_actions
  tags                = var.tags
}