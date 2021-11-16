FROM debian:buster-slim

RUN apt-get update
RUN apt-get install -y openjdk-11-jre
RUN apt-get install -y sqlite
ADD libs/qute-quote-server-0.0.1.jar /srv/qute-quote-server-0.0.1.jar

WORKDIR /srv
EXPOSE 5000
CMD ["java", "-jar", "qute-quote-server-0.0.1.jar"]