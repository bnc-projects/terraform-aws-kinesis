output "kinesis_stream_arn" {
  value = aws_kinesis_stream.default.arn
}

output "kinesis_stream_name" {
  value = aws_kinesis_stream.default.name
}