#!/bin/bash

kubectl create namespace logging


eksctl create iamserviceaccount \
--name fluent-bit \
--namespace logging \
--cluster eksworkshop-eksctl \
--attach-policy-arn "arn:aws:iam::${ACCOUNT_ID}:policy/fluent-bit-policy" \
--approve \
--override-existing-serviceaccounts


kubectl get serviceaccount -n logging
kubectl -n logging describe sa fluent-bit