locals {
  firehose_comparison_operator = "LessThanOrEqualToThreshold"
  firehose_namespace           = "AWS/Firehose"
  firehose_treat_missing_data  = "breaching"
  firehose_dimensions          = {
    DeliveryStreamName = var.kinesis-firehose_name
  }
}

resource "aws_kinesis_firehose_delivery_stream" "extended_s3_stream" {
  count       = var.create_firehose == false ? 0 : 1
  name        = var.kinesis-firehose_name
  destination = "extended_s3"
  tags        = var.tags
  kinesis_source_configuration {
    kinesis_stream_arn = aws_kinesis_stream.default.arn
    role_arn           = aws_iam_role.firehose_access_role[0].arn
  }

  extended_s3_configuration {
    role_arn           = aws_iam_role.firehose_delivery_role[0].arn
    bucket_arn         = var.s3_bucket_arn
    prefix             = var.s3_bucket_prefix
    buffer_interval    = var.buffer_interval
    buffer_size        = var.buffer_size
    compression_format = var.compression_format

    cloudwatch_logging_options {
      enabled         = var.cloudwatch_log_enable
      log_group_name  = aws_cloudwatch_log_group.log_group[0].name
      log_stream_name = aws_cloudwatch_log_stream.log_stream[0].name
    }
  }
}

resource "aws_cloudwatch_log_group" "log_group" {
  count = var.create_firehose == false ? 0 : 1
  name  = format("%s-log-group", var.kinesis-firehose_name)
}

resource "aws_cloudwatch_log_stream" "log_stream" {
  count          = var.create_firehose == false ? 0 : 1
  name           = format("%s-log-stream", var.kinesis-firehose_name)
  log_group_name = aws_cloudwatch_log_group.log_group.name
}

resource "aws_cloudwatch_metric_alarm" "firehose_alarm" {
  count               = var.create_firehose == false ? 0 : 1
  alarm_name          = format("%s-alarm", var.kinesis-firehose_name)
  comparison_operator = local.firehose_comparison_operator
  evaluation_periods  = var.firehose_alarm_evaluation_periods
  metric_name         = "DeliveryToS3.Success"
  namespace           = local.firehose_namespace
  period              = var.firehose_alarm_period
  statistic           = var.firehose_alarm_statistic
  threshold           = var.firehose_alarm_threshold
  alarm_description   = format("Alarm when data is no longer successfully pushed to S3 from %s for 5 minutes", var.kinesis-firehose_name)
  treat_missing_data  = local.firehose_treat_missing_data
  dimensions          = local.firehose_dimensions
  alarm_actions       = var.alarm_actions
  tags                = var.tags
}