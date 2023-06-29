#!/bin/bash

# Variables
CLUSTER_NAME=mundoes-cluster-G6
AWS_REGION=us-east-2

# Set AWS credentials 
aws sts get-caller-identity >> /dev/null
if [ $? -eq 0 ]
then
  echo "Credenciales testeadas, proceder con la creacion de cluster."

  # Creacion de cluster
  eksctl create cluster \
  --name $CLUSTER_NAME \
  --region $AWS_REGION \
  --nodes 3 \
  --node-type t2.small \
  --with-oidc \
  --ssh-access \
  --ssh-public-key jenkins \
  --managed \
  --full-ecr-access \
  --zones us-east-2a,us-east-2b,us-east-2c

  if [ $? -eq 0 ]
  then
    echo "Cluster Setup Completo con eksctl ."
  else
    echo "Cluster Setup Falló mientras se ejecuto eksctl."
  fi
else
  echo "Please run aws configure & set right credentials."
  echo "Cluster setup failed."
fi
