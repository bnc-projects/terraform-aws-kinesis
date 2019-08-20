variable "kinesis_stream_name" {
  type        = string
  description = "The name of the kinesis stream"
}

variable "shard_count" {
  description = "The number of shards that the stream will use"
  default     = 1
  type        = number
}

variable "retention_period" {
  description = "Length of time data records are accessible after they are added to the stream"
  default     = 24
  type        = number
}

variable "enforce_consumer_deletion" {
  description = "A boolean that indicates all registered consumers should be deregistered from the stream so that the stream can be destroyed without error"
  default     = false
  type        = bool
}

variable "shard_level_metrics" {
  description = " A list of shard-level CloudWatch metrics which can be enabled for the stream"
  type        = list
  default     = []
}

variable "encryption_type" {
  type        = string
  default     = "KMS"
  description = "The encryption type to use"
}

variable "kms_key_id" {
  type        = string
  default     = "alias/aws/kinesis"
  description = "The GUID for the customer-managed KMS key to use for encryption"
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources"
  default     = {}
}
