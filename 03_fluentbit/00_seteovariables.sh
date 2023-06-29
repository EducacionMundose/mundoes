#!/bin/bash

export AWS_REGION="us-east-2"
export ACCOUNT_ID="813559548525"
export ES_DOMAIN_NAME="eksworkshop-logging"
export ES_VERSION="7.4"
export ES_DOMAIN_USER="eksworkshop"
export ES_DOMAIN_PASSWORD="$(openssl rand -base64 12)_Ek1$"

# OIDC del cluster de elasticsearch
#
eksctl utils associate-iam-oidc-provider --cluster mundoes-cluster-G6  --approve