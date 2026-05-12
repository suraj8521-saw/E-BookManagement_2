FROM tomcat:9.0-jdk11-openjdk
COPY web/ /usr/local/tomcat/webapps/ROOT/
COPY src/ /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/
EXPOSE 8080
CMD ["catalina.sh", "run"]
