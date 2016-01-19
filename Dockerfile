FROM centos:6.6
MAINTAINER "Maksim Zakharov" <zakharov@lumoza.ru>
ENV container docker
COPY install-haskell.sh /tmp/

RUN /tmp/install-haskell.sh
CMD ["/bin/bash"]

