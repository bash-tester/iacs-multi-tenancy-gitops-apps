#!/bin/bash

###############################################################################
# Must be logged into OC from sudo to run this script. 
# Although we hope to run this rootless
###############################################################################

cd ~/DownloadDirector       # (or wherever you downloaded PAW package)

unzip ipa_workspace_local_dist_2.0.76.106.zip

sudo podman load < paw_2.0.76/images/images.tar

oc patch configs.imageregistry.operator.openshift.io/cluster --patch '{"spec":{"defaultRoute":true}}' --type=merge

REGISTRY_HOST=$(oc get route default-route -n openshift-image-registry --template='{{ .spec.host }}')

sudo podman login -u kubeadmin -p $(oc whoami -t) --tls-verify=false $REGISTRY_HOST

sudo podman tag 127.0.0.1:5000/planninganalytics/pa-glass:3.0.6301-ubi8 $REGISTRY_HOST/dev/pa-glass:3.0.6301-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/pa-cdn:3.0.6301-ubi8 $REGISTRY_HOST/dev/pa-cdn:3.0.6301-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/pa-plan-service:1.0.2022042701-ubi8 $REGISTRY_HOST/dev/pa-plan-service:1.0.2022042701-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/pa-predict-svc:1.0.781-ubi8 $REGISTRY_HOST/dev/pa-predict-svc:1.0.781-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/async-service:0.0.261-ubi8 $REGISTRY_HOST/dev/async-service:0.0.261-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/paw-ui-api:1.0.147-ubi8 $REGISTRY_HOST/dev/paw-ui-api:1.0.147-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/prism-proxy:3.0.10437-ubi8 $REGISTRY_HOST/dev/prism-proxy:3.0.10437-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/share-app:1.0.525-ubi8 $REGISTRY_HOST/dev/share-app:1.0.525-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/share-proxy:1.0.525-ubi8 $REGISTRY_HOST/dev/share-proxy:1.0.525-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/pa-gateway:1.0.1055-ubi8 $REGISTRY_HOST/dev/pa-gateway:1.0.1055-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/bss:1.0.1331-ubi8 $REGISTRY_HOST/dev/bss:1.0.1331-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/wa-proxy:1.0.866-ubi8 $REGISTRY_HOST/dev/wa-proxy:1.0.866-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/tm1proxy:1.0.362-ubi8 $REGISTRY_HOST/dev/tm1proxy:1.0.362-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/palm-service:1.0.187-ubi8 $REGISTRY_HOST/dev/palm-service:1.0.187-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/neo-provision:1.0.353-ubi8 $REGISTRY_HOST/dev/neo-provision:1.0.353-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/prism-app:3.0.5464-ubi8 $REGISTRY_HOST/dev/prism-app:3.0.5464-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/user-admin:1.0.647-ubi8 $REGISTRY_HOST/dev/user-admin:1.0.647-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/monitor:2.0.76.2602-ubi8 $REGISTRY_HOST/dev/monitor:2.0.76.2602-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/prism-platform:3.0.2080.2-ubi8 $REGISTRY_HOST/dev/prism-platform:3.0.2080.2-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/atlas-service:95-ubi8 $REGISTRY_HOST/dev/atlas-service:95-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/admintool:1.0.307-ubi8 $REGISTRY_HOST/dev/admintool:1.0.307-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/pa-content-service:1.0.265-ubi8 $REGISTRY_HOST/dev/pa-content-service:1.0.265-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/couchdb:193-ubi8 $REGISTRY_HOST/dev/couchdb:193-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/bss-init:1.0.286-ubi8 $REGISTRY_HOST/dev/bss-init:1.0.286-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/neo-idviz:9.0.526-ubi8 $REGISTRY_HOST/dev/neo-idviz:9.0.526-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/redis:1.0.176-ubi8 $REGISTRY_HOST/dev/redis:1.0.176-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/ibm-java8:202-ubi8 $REGISTRY_HOST/dev/ibm-java8:202-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/mongo:1.0.172-ubi8 $REGISTRY_HOST/dev/mongo:1.0.172-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/share-platform:1.0.379-ubi8 $REGISTRY_HOST/dev/share-platform:1.0.379-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/mysql-cluster:2.0.167-ubi8 $REGISTRY_HOST/dev/mysql-cluster:2.0.167-ubi8
sudo podman tag 127.0.0.1:5000/planninganalytics/k8s-config:1.0.103-ubi8 $REGISTRY_HOST/dev/k8s-config:1.0.103-ubi8

sudo podman push $REGISTRY_HOST/dev/pa-glass:3.0.6301-ubi8
sudo podman push $REGISTRY_HOST/dev/pa-cdn:3.0.6301-ubi8
sudo podman push $REGISTRY_HOST/dev/pa-plan-service:1.0.2022042701-ubi8
sudo podman push $REGISTRY_HOST/dev/pa-predict-svc:1.0.781-ubi8
sudo podman push $REGISTRY_HOST/dev/async-service:0.0.261-ubi8
sudo podman push $REGISTRY_HOST/dev/paw-ui-api:1.0.147-ubi8
sudo podman push $REGISTRY_HOST/dev/prism-proxy:3.0.10437-ubi8
sudo podman push $REGISTRY_HOST/dev/share-app:1.0.525-ubi8
sudo podman push $REGISTRY_HOST/dev/share-proxy:1.0.525-ubi8
sudo podman push $REGISTRY_HOST/dev/pa-gateway:1.0.1055-ubi8
sudo podman push $REGISTRY_HOST/dev/bss:1.0.1331-ubi8
sudo podman push $REGISTRY_HOST/dev/wa-proxy:1.0.866-ubi8
sudo podman push $REGISTRY_HOST/dev/tm1proxy:1.0.362-ubi8
sudo podman push $REGISTRY_HOST/dev/palm-service:1.0.187-ubi8
sudo podman push $REGISTRY_HOST/dev/neo-provision:1.0.353-ubi8
sudo podman push $REGISTRY_HOST/dev/prism-app:3.0.5464-ubi8
sudo podman push $REGISTRY_HOST/dev/user-admin:1.0.647-ubi8
sudo podman push $REGISTRY_HOST/dev/monitor:2.0.76.2602-ubi8
sudo podman push $REGISTRY_HOST/dev/prism-platform:3.0.2080.2-ubi8
sudo podman push $REGISTRY_HOST/dev/atlas-service:95-ubi8
sudo podman push $REGISTRY_HOST/dev/admintool:1.0.307-ubi8
sudo podman push $REGISTRY_HOST/dev/pa-content-service:1.0.265-ubi8
sudo podman push $REGISTRY_HOST/dev/couchdb:193-ubi8
sudo podman push $REGISTRY_HOST/dev/bss-init:1.0.286-ubi8
sudo podman push $REGISTRY_HOST/dev/neo-idviz:9.0.526-ubi8
sudo podman push $REGISTRY_HOST/dev/redis:1.0.176-ubi8
sudo podman push $REGISTRY_HOST/dev/ibm-java8:202-ubi8
sudo podman push $REGISTRY_HOST/dev/mongo:1.0.172-ubi8
sudo podman push $REGISTRY_HOST/dev/share-platform:1.0.379-ubi8
sudo podman push $REGISTRY_HOST/dev/mysql-cluster:2.0.167-ubi8
sudo podman push $REGISTRY_HOST/dev/k8s-config:1.0.103-ubi8
