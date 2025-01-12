[![Build status](https://github.com/topfreegames/kubectl-docker-image/workflows/Publish%20new%20Docker%20image/badge.svg
)](https://github.com/topfreegames/kubectl-docker-image/actions)
[![Docker Repository on Docker Hub](https://img.shields.io/badge/Docker%20Hub-ready-%23099cec)](https://hub.docker.com/r/tfgco/kubectl)
[![Docker Repository on Quay](https://img.shields.io/badge/Quay.io-ready-%23BE0000)](https://quay.io/repository/tfgco/kubectl)

# Kubectl Image

Kubectl and other minor tools installed in an alpine based image. Used for kubernetes deployments in CI/CD pipelines.

Current tools:

- `kubectl`
- `docker-cli`
- `docker-compose`
- `helm v3`
- `bash`
- `curl`
- `git`
- `make`
- `aws-cli`

On the aws-cli version we also includes the aws-cli v2 in it.

### add kubectl auto completion
echo 'source <(kubectl completion bash)' >>~/.bashrc


## Latest versions

[![Normal Docker Image Size](https://img.shields.io/docker/v/tfgco/kubectl/latest?label=normal%20version&color=blue)](https://hub.docker.com/r/tfgco/kubectl)
[![Aws-cli Docker Image Size](https://img.shields.io/docker/v/tfgco/kubectl/aws-cli?label=aws-cli%20version&color=yellow)](https://hub.docker.com/r/tfgco/kubectl)
[![Normal Docker Image Size](https://img.shields.io/docker/image-size/tfgco/kubectl/latest?label=normal%20image%20size&color=lightgray)](https://hub.docker.com/r/tfgco/kubectl)
[![Aws-cli Docker Image Size](https://img.shields.io/docker/image-size/tfgco/kubectl/aws-cli?label=aws-cli%20image%20size&color=lightgray)](https://hub.docker.com/r/tfgco/kubectl)

## Hosted at

Quay: https://quay.io/repository/tfgco/kubectl

Docker Hub: https://hub.docker.com/r/tfgco/kubectl
