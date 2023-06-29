#!/bin/bash

export FLUENTBIT_ROLE=$(eksctl get iamserviceaccount --cluster ${CLUSTER_NAME} --namespace logging -o json | jq '.[].status.roleARN' -r) 
export ES_ENDPOINT=$(aws es describe-elasticsearch-domain --domain-name ${ES_DOMAIN_NAME} --output text --query "DomainStatus.Endpoint")


curl -sS -u "${ES_DOMAIN_USER}:${ES_DOMAIN_PASSWORD}" \
    -X PATCH \
    https://${ES_ENDPOINT}/_opendistro/_security/api/rolesmapping/all_access?pretty \
    -H 'Content-Type: application/json' \
    -d'
[
  {
    "op": "add", "path": "/backend_roles", "value": ["'${FLUENTBIT_ROLE}'"]
  }
]
'