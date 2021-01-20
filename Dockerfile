FROM quay.io/generic/rhel7:latest
MAINTAINER aPaaS : Rejeeb
USER root
ENV CorrectURLFromDockerFile='https://abc123.com/q?key1=value1&key2=value2'
EXPOSE 5000
ENTRYPOINT ["bash"]
CMD ["sleep 20"]
