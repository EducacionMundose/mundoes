#!/bin/bash
# Instalar Prometheus y Grafana usnado Helm (Manejador de paquetes para kubernetes)

# Agregar repo de prometheus
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

# Agregar repo de grafana
helm repo add grafana https://grafana.github.io/helm-charts

helm repo update
# Crear el namespace prometheus
kubectl create namespace prometheus

# Desplegar prometheus en EKS

helm install prometheus prometheus-community/prometheus \
--namespace prometheus \
--set alertmanager.persistentVolume.storageClass="gp2" \
--set server.persistentVolume.storageClass="gp2"

# Verificar la instalación
kubectl get all -n prometheus

# Exponer prometheus en la instancia de EC2 en el puerto 8080
kubectl port-forward -n prometheus deploy/prometheus-server 8080:9090 --address 0.0.0.0
