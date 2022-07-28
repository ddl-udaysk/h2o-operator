#!/bin/bash

set -e

kubectl apply -f deploy/crds/apps.dominodatalab.com_h2oclusters_crd.yaml  
kubectl apply -f deploy/service_account.yaml
kubectl apply -f deploy/role.yaml
kubectl apply -f deploy/role_binding.yaml
kubectl apply -f deploy/operator.yaml

sleep 10
kubectl logs -f -l name=h2o-operator -n domino-platform 
