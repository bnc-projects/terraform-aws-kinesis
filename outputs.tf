output "kinesis_stream_url" {
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