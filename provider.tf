provider "aws" {
    region = "${var.AWS_REGION}"
    shared_credentials_file = "${HOME}/.aws/credentials"
    profile = "terraform"
}
