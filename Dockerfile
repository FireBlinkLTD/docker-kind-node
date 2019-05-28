FROM node:alpine

# Add
RUN apk add --no-cache \
      curl \
      bash \
      openssl \
      docker

# Install kubectl, kubeadm and helm
ENV KUBERNETES_VERSION="1.11.3"
RUN curl -L https://storage.googleapis.com/kubernetes-release/release/v${KUBERNETES_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

RUN curl -L https://git.io/get_helm.sh | bash

RUN curl -L https://storage.googleapis.com/kubernetes-release/release/v${KUBERNETES_VERSION}/bin/linux/amd64/kubeadm -o /usr/local/bin/kubeadm \
    && chmod +x /usr/local/bin/kubeadm


# Install kind (kubernetes in docker)
RUN curl -Lo /usr/local/bin/kind https://github.com/kubernetes-sigs/kind/releases/download/v0.3.0/kind-linux-amd64 && \
      chmod +x /usr/local/bin/kind

# Verify that everything has been installed
RUN kubectl version --client
RUN docker -v
RUN node -v
RUN npm -v
RUN yarn -v