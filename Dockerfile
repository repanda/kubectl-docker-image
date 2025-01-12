FROM python:3.10.5-alpine3.16 as builder

ENV AWS_CLI_VERSION=2.7.16

RUN set -ex; \
apk add --no-cache \
git unzip groff build-base libffi-dev cmake

RUN set -eux; \
git clone --single-branch --depth 1 -b ${AWS_CLI_VERSION} https://github.com/aws/aws-cli.git; \
cd /aws-cli; \
sed -i'' 's/PyInstaller.*/PyInstaller==5.2/g' requirements-build.txt; \
python -m venv venv; \
. venv/bin/activate; \
./scripts/installers/make-exe

RUN set -ex; \
unzip /aws-cli/dist/awscli-exe.zip; \
./aws/install --bin-dir /aws-cli-bin; \
/aws-cli-bin/aws --version

FROM alpine:3.16.0

LABEL maintainer="Wildlife Studios"

ARG BASH_VERSION="5.1.16-r2"
ARG CURL_VERSION="7.83.1-r2"
ARG DOCKER_CLI_VERSION="20.10.16-r0"
ARG DOCKER_COMPOSE_VERSION="1.29.2-r2"
ARG GIT_VERSION="2.36.2-r0"
ARG MAKE_VERSION="4.3-r0"

ARG KUBECTL_VERSION="v1.23.8"
ARG HELM_VERSION="v3.9.0"

RUN apk --no-cache upgrade
RUN apk --no-cache add bash=${BASH_VERSION} \
            curl=${CURL_VERSION} \
            docker-cli=${DOCKER_CLI_VERSION} \
            docker-compose=${DOCKER_COMPOSE_VERSION} \
            git=${GIT_VERSION} \
            make=${MAKE_VERSION} 

RUN curl https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl --output /bin/kubectl \ 
    && chmod u+x /bin/kubectl

RUN curl https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz  --output - | \
    tar -xzf - -C /tmp/ \
    && mv /tmp/linux-amd64/helm /bin/ \
    && chmod +x /bin/helm \
    && rm -rf /tmp/linux-amd64    

COPY --from=builder /usr/local/aws-cli/ /usr/local/aws-cli/
COPY --from=builder /aws-cli-bin/ /usr/local/bin/

ENTRYPOINT [ "/bin/bash", "-c" ]
CMD [ "bash" ]
