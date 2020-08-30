This plugin allows to update a Kubernetes statefulset.

## Usage  

This pipeline will update the `my-statefulset` statefulset with the image tagged `DRONE_COMMIT_SHA:0:8`

```yaml
kind: pipeline
type: kubernetes
name: my-statefulset-deploy

steps:
- name: deployT0K8s
  image: oxmh/kubectl2
  settings:
    kubernetes_server:
      from_secret: kubernetes_server
    kubernetes_cert:
      from_secret: kubernetes_cert
    kubernetes_token:
      from_secret: kubernetes_token
    namespace: prod
    statefulset: my-statefulset
    repo: myorg/myrepo
    container: my-container
    tag: "${DRONE_COMMIT_SHA:0:8}"

```
