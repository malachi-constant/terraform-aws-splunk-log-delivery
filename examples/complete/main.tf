# configure aws provider
provider "aws" {
  region = "us-west-2"
}

# get current aws account id from provider
data "aws_caller_identity" "this" {}

# instantiate module
module "splunk_delivery" {
  source                             = "../../"
  prefix                             = "splunk-complete-test"
  splunk_hec_url                     = "https://example.splunkcloud.com"
  splunk_hec_token                   = "51D4DA16-C61B-4F5F-8EC7-ED4301342A4A"
  enable_logs_encryption             = true
  kms_alias                          = "splunk-delivery"
  kms_description                    = "this is my kms key for firehose and lambda logs"
  enable_key_rotation                = true
  nodejs_runtime                     = "nodejs12.x"
  timeout                            = 300
  memory_size                        = 256
  kinesis_firehose_buffer            = 5
  kinesis_firehose_buffer_interval   = 300
  hec_acknowledgment_timeout         = 300
  hec_endpoint_type                  = "Raw"
  enable_firehose_cloudwatch_logging = true
  s3_backup_mode                     = "FailedEventsOnly"
  s3_compression_format              = "GZIP"
  s3_prefix                          = "kinesis-firehose/"
  s3_bucket_versioning               = true
  cloudwatch_log_retention           = 30

  sender_account_ids = [
    data.aws_caller_identity.this.account_id
  ]

  tags = {
    "Application" = "TestApp"
  }
}
