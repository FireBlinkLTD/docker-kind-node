FROM node:lts-alpine

# Add
RUN apk add --no-cache \
      curl \
      bash \
      openssl \
      docker

# Install kubectl
ENV KUBERNETES_VERSION="1.19.0"
RUN curl -L https://storage.googleapis.com/kubernetes-release/release/v${KUBERNETES_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

# Install Helm 3
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# Install Helm v2
RUN curl -L https://get.helm.sh/helm-v2.16.10-linux-amd64.tar.gz -o helm_v2.tar.gz && \
    tar xvzf helm_v2.tar.gz && \
    mv linux-amd64/helm /usr/local/bin/helm_v2 && \
    rm -rf linux-amd64 && \
    rm helm_v2.tar.gz

# Install kind (kubernetes in docker)
ENV KIND_VERSION="0.8.1"
RUN curl -Lo /usr/local/bin/kind https://github.com/kubernetes-sigs/kind/releases/download/v${KIND_VERSION}/kind-linux-amd64 && \
      chmod +x /usr/local/bin/kind

# Verify that everything has been installed
RUN kubectl version --client
RUN helm version
RUN helm_v2 version --client
RUN docker -v
RUN node -v
RUN npm -v
RUN yarn -v