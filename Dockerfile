FROM openjdk:8
MAINTAINER Naman Agarwal agarwalnaman35@gmail.com
WORKDIR ./
COPY ./target/devops_calculator-1.0-SNAPSHOT.jar ./
EXPOSE 8080
ENTRYPOINT ["java, "-jar", "devops_calculator-1.0-SNAPSHOT.jar"]
