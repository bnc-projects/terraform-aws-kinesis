variable "alarm_actions" {
  type        = list(string)
  description = "The list of actions to execute when this alarm transitions into an ALARM state from any other state. Each action is specified as an Amazon Resource Name (ARN)."
  default     = []
}

variable "create_firehose" {
  type        = bool
  description = "When set to true a AWS Firehose delivery stream is setup to process records from the Kinesis stream"
  default     = false
}

variable "encryption_type" {
  type        = string
  default     = "KMS"
  description = "The encryption type to use"
}

variable "firehose_extended_s3_configuration" {
  type        = map
  description = "A object of the extended s3 object"
}
variable "firehose_name" {
  type        = string
  description = "The name of the firehose delivery stream"
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




