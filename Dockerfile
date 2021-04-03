FROM tomcat:latest
RUN apt-get update
RUN apt-get install git -y
RUN apt-get install default-jdk -y
RUN apt-get install maven -y
#RUN apt-get update && apt-get install tomcat8 -y
EXPOSE 8080
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd boxfuse-sample-java-war-hello && mvn package && cp -R /target/* $CATALINA_HOME/webapps/
#CMD ["tomcat8", "-g", "daemon off;"]