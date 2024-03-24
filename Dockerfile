FROM openjdk:17-jdk

# ARG takes variable from --build-arg, example: "docker build --build-arg var=xxx", ENV uses variable from ARG in the dockerfile
ARG VERSION 
ENV VERSION=${VERSION}

# Create a new non-root user
RUN groupadd -r jenkins && useradd --no-log-init -r -g jenkins jenkins

RUN sh -c 'mkdir -p /opt/helm && mkdir -p /opt/tls'

COPY ./target/hipwebplannerbe-${VERSION}.jar /opt/helm/hipwebplannerbe.jar


WORKDIR /opt/helm
USER root
RUN chown -R jenkins:jenkins /opt/helm

# Switch to the new user
USER jenkins

RUN sh -c 'touch hipwebplannerbe.jar'
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 CMD [ "/" ]
ENTRYPOINT ["java","-jar","hipwebplannerbe.jar"]
