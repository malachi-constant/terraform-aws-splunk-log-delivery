# configure aws provider
provider "aws" {
  region = "us-west-2"
}

# get current aws account id from provider
data "aws_caller_identity" "this" {}

# instantiate module
module "splunk_delivery" {
  source           = "../../"
  splunk_hec_url   = "https://example.splunkcloud.com"
  splunk_hec_token = "51D4DA16-C61B-4F5F-8EC7-ED4301342A4A"
  sender_account_ids = [
    data.aws_caller_identity.this.account_id
  ]
}

# test producer
resource "aws_cloudwatch_log_group" "this" {
  name = "splunk-delivery-test"
}

resource "aws_cloudwatch_log_stream" "foo" {
  name           = "splunk-delivery-test"
  log_group_name = aws_cloudwatch_log_group.this.name
}

resource "aws_cloudwatch_log_subscription_filter" "this" {
  name            = "splunk-delivery-test"
  log_group_name  = aws_cloudwatch_log_group.this.name
  filter_pattern  = "logtype test"
  destination_arn = module.splunk_delivery.cloudwatch_destination_arn
}
