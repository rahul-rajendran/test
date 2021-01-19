FROM registry.redhat.io/rhel7:latest
MAINTAINER aPaaS : Lineesh NM
USER root
ENV ARTURL='https://abc123.com/q?key1=value1&key2=value2'
EXPOSE 5000
ENTRYPOINT ["bash"]
CMD ["sleep 20"]
