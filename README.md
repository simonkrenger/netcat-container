# netcat-container

A container running `netcat` accepting TCP connections on port 2345.

## Run it locally

~~~
podman run -p 2345:2345 quay.io/simonkrenger/netcat:latest
~~~

## Run it in Kubernetes

~~~
---
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: netcat
  name: netcat
spec:
  replicas: 1
  selector:
    matchLabels:
      deployment: netcat
  template:
    metadata:
      labels:
        deployment: netcat
    spec:
      containers:
      - image: quay.io/simonkrenger/netcat:latest
        name: netcat
        ports:
        - containerPort: 2345
          protocol: TCP
---
apiVersion: v1
kind: Service
metadata:
  labels:
    app: netcat
  name: netcat
spec:
  ports:
  - port: 2345
    protocol: TCP
    targetPort: 2345
  selector:
    deployment: netcat
  type: ClusterIP
~~~
