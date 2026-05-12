# Stable Tomcat 9 with Java 17
FROM tomcat:9.0-jdk17-corretto

# THE FIX FOR LATE REGISTRATION & EMAIL TIMEOUT (Force IPv4)
ENV CATALINA_OPTS="-Djava.net.preferIPv4Stack=true"

# Purane files delete karo
RUN rm -rf /usr/local/tomcat/webapps/*

# MySQL Driver
ADD https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.30/mysql-connector-java-8.0.30.jar /usr/local/tomcat/lib/

# JAKARTA EMAIL LIBRARIES (Aapke code ke hisaab se)
ADD https://repo1.maven.org/maven2/com/sun/mail/jakarta.mail/2.0.1/jakarta.mail-2.0.1.jar /usr/local/tomcat/lib/
ADD https://repo1.maven.org/maven2/com/sun/activation/jakarta.activation/2.0.1/jakarta.activation-2.0.1.jar /usr/local/tomcat/lib/

# Apni war file copy karo
COPY app.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
