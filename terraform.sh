#!/bin/bash

##get the latest infrastructure state
terraform remote config -backend=s3 -backend-config="bucket=tf-aws-automation-infra-states-repo" -backend-config="key=terraform.tfstate" -backend-config="region=us-east-1"

##save the changes before apply
terraform plan -out out.terraform

##apply changes if and only if these changes are indeed what you need

while true; do
    read -p "Do you wish to apply these changes [Y/N] ?" yn
    case $yn in
        [Yy]* ) terraform apply out.terraform; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer Y or N";;
    esac
done
