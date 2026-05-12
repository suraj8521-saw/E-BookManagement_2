# Stable Tomcat 9 with Java 17
FROM tomcat:9.0-jdk17-corretto

# Purane files delete karo
RUN rm -rf /usr/local/tomcat/webapps/*

# THE MAGIC LINE: MySQL Driver ko direct Tomcat ki library mein download kar do
ADD https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.30/mysql-connector-java-8.0.30.jar /usr/local/tomcat/lib/

# Apni war file ko direct ROOT.war bana kar copy karo
COPY app.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
