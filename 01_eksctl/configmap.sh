#!/bin/bash

kubectl edit -n kube-system configmap/aws-auth

#  mapUsers: |
#    - groups:
#    - system:masters
#      userarn:  <arn:aws:iam::xxxx:user/xxx
#      username: xxx