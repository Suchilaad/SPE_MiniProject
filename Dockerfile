FROM openjdk:8
MAINTAINER Suchi Laad suchilaad148@gmail.com
WORKDIR ./
COPY ./target/devops_calculator-1.0-SNAPSHOT.jar ./
EXPOSE 8080
CMD ["ls -al"]
