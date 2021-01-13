# variables

# meta
variable "prefix" {
  default     = "splunk-test"
  description = "Prefix for naming resources"
}

variable "tags" {
  type        = map(string)
  description = "Map of tags to put on the resource"
  default     = {}
}

# kms
variable "enable_logs_encryption" {
  description = "enable kms encyrption for cloudwatch logs"
  default     = true
}

variable "kms_alias" {
  description = "Alias for the KMS key"
  default     = "alias/splunk-delivery"
}

variable "kms_description" {
  description = "KMS key description"
  default     = null
}

variable "kms_key_policy" {
  description = "JSON of kms key policy"
  default     = null
}

variable "enable_key_rotation" {
  description = "Enable KMS key rotation"
  default     = false
}

# lambda
variable "nodejs_runtime" {
  description = "Runtime version of nodejs for Lambda function"
  default     = "nodejs12.x"
}

variable "timeout" {
  description = "Timeout value for Lambda function"
  default     = 300
}

variable "memory_size" {
  description = "Timeout value for Lambda function"
  default     = 256
}

# firehose
variable "kinesis_firehose_buffer" {
  description = "https://www.terraform.io/docs/providers/aws/r/kinesis_firehose_delivery_stream.html#buffer_size"
  default     = 5 # Megabytes
}

variable "kinesis_firehose_buffer_interval" {
  description = "Buffer incoming data for the specified period of time, in seconds, before delivering it to the destination"
  default     = 300 # Seconds
}

variable "splunk_hec_url" {
  description = "Splunk Kinesis URL for submitting CloudWatch logs to splunk"
}

variable "splunk_hec_token" {
  description = "Splunk security token needed to submit data to Splunk"
}

variable "hec_acknowledgment_timeout" {
  description = "The amount of time, in seconds between 180 and 600, that Kinesis Firehose waits to receive an acknowledgment from Splunk after it sends it data."
  default     = 300
}

variable "hec_endpoint_type" {
  description = "Splunk HEC endpoint type; `Raw` or `Event`"
  default     = "Raw"
}

variable "enable_firehose_cloudwatch_logging" {
  description = "Enable kinesis firehose CloudWatch logging. (It only logs errors)"
  default     = true
}

# s3
variable "s3_backup_mode" {
  description = "Defines how documents should be delivered to Amazon S3. Valid values are FailedEventsOnly and AllEvents."
  default     = "FailedEventsOnly"
}

variable "s3_compression_format" {
  description = "The compression format for what the Kinesis Firehose puts in the s3 bucket"
  default     = "GZIP"
}

variable "s3_prefix" {
  description = "Optional prefix (a slash after the prefix will show up as a folder in the s3 bucket).  The YYYY/MM/DD/HH time format prefix is automatically used for delivered S3 files."
  default     = "kinesis-firehose/"
}

variable "s3_access_logs_bucket" {
  description = "Name of the S3 bucket for S3 access logs"
  default     = null
}

variable "s3_bucket_versioning" {
  description = "Enable bucket versioning."
  default = true
}

# cw logs
variable "sender_account_ids" {
  type        = list
  default     = []
  description = "List of AWS account ids to allow subscription to cloudwatch destination."
}

variable "cloudwatch_log_retention" {
  description = "Length in days to keep CloudWatch logs of Kinesis Firehose"
  default     = 30
}
