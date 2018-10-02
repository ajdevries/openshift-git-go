FROM openshift/origin-base

MAINTAINER Albert-Jan de Vries

LABEL io.k8s.description="Openshift Git and Go" \
      io.k8s.display-name="Openshift Git and Go" \
      io.openshift.tags="openshift,git,go"

ENV GO_VERSION=1.10.1 \
    GOROOT=/go \
    GOPATH=/gocode \
    TZ=Europe/Amsterdam

RUN yum install -y gcc git \
 && curl -jksSL https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz | gunzip -c - | tar -xf - -C /

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN yum clean all
