FROM alpine
MAINTAINER Jon Brisbin <jon@jbrisbin.com>

RUN \
  apk update && \
  apk add inotify-tools git bash openssh-client

COPY git-watch.sh /usr/sbin/git-watch.sh
RUN chmod a+x /usr/sbin/git-watch.sh

ENTRYPOINT ["/usr/sbin/git-watch.sh"]
