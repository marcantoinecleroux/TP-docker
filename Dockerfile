#get base image
FROM adoptopenjdk/openjdk12:latest

#env variable
ENV SBT_VERSION 1.2.3

RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get update && apt-get -qq -y install unzip zip git tesseract-ocr 

#install sbt
RUN \
  curl -L -o sbt-$SBT_VERSION.deb https://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  rm sbt-$SBT_VERSION.deb && \
  apt-get update && \
  apt-get install sbt && \
  sbt sbtVersion

#RUN curl -s "https://get.sdkman.io" | bash \
#	source "/root/.sdkman/bin/sdkman-init.sh" \
#	sdk install sbt

WORKDIR /root

COPY ./OS-docker-TP-Scala go

CMD [" sbt", " --error run"]