FROM node:alpine

# Add
RUN apk add --no-cache \
      curl \
      bash \
      openssl \
      docker

# Install kubectl
ENV KUBERNETES_VERSION="1.17.0"
RUN curl -L https://storage.googleapis.com/kubernetes-release/release/v${KUBERNETES_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

# Install Helm 3
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# Install kind (kubernetes in docker)
RUN curl -Lo /usr/local/bin/kind https://github.com/kubernetes-sigs/kind/releases/download/v0.7.0/kind-linux-amd64 && \
      chmod +x /usr/local/bin/kind

# Verify that everything has been installed
RUN kubectl version --client
RUN helm version
RUN docker -v
RUN node -v
RUN npm -v
RUN yarn -v