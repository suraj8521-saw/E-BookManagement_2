FROM tomcat:9.0-jdk17-corretto

# Speed fix (IPv4 force) taaki registration late na ho
ENV CATALINA_OPTS="-Djava.net.preferIPv4Stack=true"

RUN rm -rf /usr/local/tomcat/webapps/*

# MySQL aur Jakarta Mail Libraries (Must have)
ADD https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.30/mysql-connector-java-8.0.30.jar /usr/local/tomcat/lib/
ADD https://repo1.maven.org/maven2/com/sun/mail/jakarta.mail/2.0.1/jakarta.mail-2.0.1.jar /usr/local/tomcat/lib/
ADD https://repo1.maven.org/maven2/com/sun/activation/jakarta.activation/2.0.1/jakarta.activation-2.0.1.jar /usr/local/tomcat/lib/

COPY app.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
