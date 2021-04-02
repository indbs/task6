FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install git -y
RUN apt-get install default-jdk -y
RUN apt-get install maven -y
RUN apt-get install tomcat9 -y
EXPOSE 8080
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd boxfuse-sample-java-war-hello
RUN mvn package
RUN cp target/hello-1.0.war var/lib/tomcat9/webapps
CMD ["tomcat9", "-g", "daemon off;"]