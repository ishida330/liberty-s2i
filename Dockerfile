
FROM websphere-liberty:webProfile7
MAINTAINER Noel OConnor <noconnor@redhat.com>

ENV BUILDER_VERSION 1.0

LABEL io.k8s.description="Platform for deploying wars onto the liberty web profile 7" \
      io.k8s.display-name="Liberty builder 1.0" \
      io.openshift.expose-services="9080:http,9443:https" \
      io.openshift.tags="builder,websphere-liberty,webProfile7" \
      io.openshift.s2i.destination="/tmp/wars/"

LABEL io.openshift.s2i.scripts-url=image:///usr/local/sti

COPY ./.s2i/bin/ /usr/local/s2i

USER 0

RUN chown -R root /config/dropins/

RUN chmod -R a+x /usr/local/sti

RUN mkdir /tmp/wars

EXPOSE 9080 9443

CMD ["usage"]
