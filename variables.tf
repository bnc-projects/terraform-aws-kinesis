variable "alarm_actions" {
  type        = list(string)
  description = "The list of actions to execute when this alarm transitions into an ALARM state from any other state. Each action is specified as an Amazon Resource Name (ARN)."
  default     = []
}

variable "encryption_type" {
  type        = string
  default     = "KMS"
  description = "The encryption type to use"
}

variable "kinesis_stream_name" {
  type        = string
  description = "The name of the kinesis stream"
}

variable "kms_key_id" {
  type        = string
  default     = "alias/aws/kinesis"
  description = "The GUID for the customer-managed KMS key to use for encryption"
}

variable "read_throughput_evaluation_periods" {
  type        = number
  description = "The number of periods over which data is compared to the specified threshold."
  default     = 1
}

variable "read_throughput_period" {
  type        = number
  description = "The period in seconds over which the specified statistic is applied."
  default     = 60
}

variable "read_throughput_statistic" {
  type        = string
  description = "The statistic to apply to the alarm's associated metric. Either of the following is supported: SampleCount, Average, Sum, Minimum, Maximum"
  default     = "Average"
}

variable "read_throughput_threshold" {
  type        = number
  description = "The value against which the specified statistic is compared."
  default     = 0
}

variable "retention_period" {
  description = "Length of time data records are accessible after they are added to the stream"
  default     = 24
  type        = number
}

variable "shard_count" {
  description = "The number of shards that the stream will use"
  default     = 1
  type        = number
}

variable "shard_level_metrics" {
  description = " A list of shard-level CloudWatch metrics which can be enabled for the stream"
  type        = list(string)
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources"
  default     = {}
}

variable "write_throughput_evaluation_periods" {
  type        = number
  description = "The number of periods over which data is compared to the specified threshold."
  default     = 1
}

variable "write_throughput_period" {
  type        = number
  description = "The period in seconds over which the specified statistic is applied."
  default     = 60
}

variable "write_throughput_statistic" {
  type        = string
  description = "The statistic to apply to the alarm's associated metric. Either of the following is supported: SampleCount, Average, Sum, Minimum, Maximum"
  default     = "Average"
}

variable "write_throughput_threshold" {
  type        = number
  description = "The value against which the specified statistic is compared."
  default     = 0
}

variable "create_firehose" {
  type        = bool
  description = "Indicate whether to create kinesis firehose"
  default     = false
}

variable "kinesis-firehose_name" {
  type        = string
  description = "The name of kinesis firehose"
  default     = ""
}

variable "s3_bucket_arn" {
  type        = string
  description = "The ARN of the S3 bucket"
  default     = ""
}

variable "s3_bucket_prefix" {
  type        = string
  description = "The name of the folder to store data"
  default     = ""
}

variable "s3_bucket_error_prefix" {
  type        = string
  description = "The name of the folder to store error data"
  default     = ""
}

variable "buffer_size" {
  type        = number
  description = "Buffer incoming data to the specified size, in MBs, before delivering it to the destination"
  default     = 128
}

variable "buffer_interval" {
  type        = number
  description = "Buffer incoming data for the specified period of time, in seconds, before delivering it to the destination"
  default     = 900
}

variable "compression_format" {
  type        = string
  description = "The compression format"
  default     = "UNCOMPRESSED"
}

variable "cloudwatch_log_enable" {
  type        = bool
  description = "Check if the cloudwatch log is enabled"
  default     = true
}

variable "data_format_conversion_enable" {
  type        = bool
  description = "Check if the data conversion is enabled"
  default     = false
}

variable "firehose_alarm_evaluation_periods" {
  type        = number
  description = "The number of periods over which data is compared to the specified threshold."
  default     = 1
}

variable "firehose_alarm_threshold" {
  type        = number
  description = "The value against which the specified statistic is compared."
  default     = 0
}

variable "firehose_alarm_period" {
  type        = number
  description = "The period in seconds over which the specified statistic is applied."
  default     = 300
}

variable "firehose_alarm_statistic" {
  type        = string
  description = "The statistic to apply to the alarm's associated metric. Either of the following is supported: SampleCount, Average, Sum, Minimum, Maximum"
  default     = "Sum"
}

variable "aws_account_id" {
  type        = string
  description = "The aws account of id that creates resources"
  default     = ""
}

variable "data_format_conversion_schema" {
  type        = map(string)
  description = "The schema configuration of glue table"
  default     = {
    database_name = ""
    table_name    = ""
    region        = ""
  }
}


