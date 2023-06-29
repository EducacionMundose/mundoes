#!/bin/bash

# Crear la carpeta logging dentro de
mkdir -p ~/environment/logging/
# Crear el archivo fluent-bit-policy.json
cat <<EoF > ~/environment/logging/fluent-bit-policy.json
{
"Version": "2012-10-17",
"Statement": [
{
"Action": [
"es:ESHttp*"
],
"Resource":
"arn:aws:es:${AWS_REGION}:${ACCOUNT_ID}:domain/${ES_DOMAIN_NAME}/*",
"Effect": "Allow"
}
]
}
EoF
# Crear la policy de fluent bit
aws iam create-policy \
--policy-name fluent-bit-policy \
--policy-document file://~/environment/logging/fluent-bit-policy.json