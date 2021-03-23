FROM registry.fedoraproject.org/fedora-minimal:33

RUN microdnf install -y nc && microdnf clean all

USER 1001

EXPOSE 2345

CMD ["nc", "-v", "-k", "-l", "2345"]
