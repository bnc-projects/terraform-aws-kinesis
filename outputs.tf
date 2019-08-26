output "kinesis_stream_arn" {
  value = aws_kinesis_stream.default.arn
}

output "kinesis_stream_name" {
  value = aws_kinesis_stream.default.name
}

output "read_throughout_exceed_alarm_name" {
value = aws_cloudwatch_metric_alarm.read_throughput_exceeded.arn
}

output "write_throughout_exceed_alarm_name" {
value = aws_cloudwatch_metric_alarm.write_throughput_exceeded.arn
}

output "kinesis_firehose_arn" {
  value = aws_kinesis_firehose_delivery_stream.extended_s3_stream[0].arn
}

output "kinesis_firehose_name" {
  value = aws_kinesis_firehose_delivery_stream.extended_s3_stream[0].name
}

output "firehose_alarm_name" {
  value = aws_cloudwatch_metric_alarm.firehose_alarm[0].arn
}