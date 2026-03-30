#!/bin/bash

SG_ID="sg-09b115c1d01c0b270"
AMI_ID="ami-0220d79f3f480ecf5"
INSTANCE_TYPE="t3.micro"

aws ec2 run-instances \
      --image-id $AMI_ID \
      --instance-type $INSTANCE_TYPE \
      --security-group-ids $SG_ID \
      --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=docker-instructions},
          {Key=Environment,Value=dev}, {Key=CreatedBy,Value=shell-script}]"
