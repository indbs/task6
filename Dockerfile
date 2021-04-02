FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install git -y
RUN apt-get install default-jdk -y
RUN apt-get install maven -y
RUN apt-get update && apt-get install tomcat8 -y
EXPOSE 8080
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd boxfuse-sample-java-war-hello && mvn package && cp -R /target/* /var/lib/tomcat8/webapps/
CMD ["tomcat9", "-g", "daemon off;"]