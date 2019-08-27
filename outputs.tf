output "kinesis_stream_arn" {
  value = aws_kinesis_stream.default.arn
}

output "kinesis_stream_name" {
  value = aws_kinesis_stream.default.name
}

output "kinesis_firehose_arn" {
  value = aws_kinesis_firehose_delivery_stream.extended_s3_stream[0].arn
}

output "kinesis_firehose_name" {
  value = aws_kinesis_firehose_delivery_stream.extended_s3_stream[0].name
}