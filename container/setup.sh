
#!/bin/bash
docker login -u "$DOCKERHUB_USERNAME" -p "$DOCKERHUB_PASSWORD"
docker build -t eldntr7/nginx-rtmp-server:latest .
# Memuat image ke kluster Kind
kind load docker-image eldntr7/nginx-rtmp-server:latest
docker push eldntr7/nginx-rtmp-server:latest

kubectl create secret docker-registry regcred \
  --docker-server=https://index.docker.io/v1/ \
  --docker-username=$DOCKERHUB_USERNAME \
  --docker-password=$DOCKERHUB_PASSWORD \
  --docker-email=you@example.com