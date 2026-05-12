# Docker Hub ka sabse stable Tomcat 9 tag jo JDK 17 support karta hai
FROM tomcat:9-jdk17-openjdk-slim

# Purane webapps folder ko clear karein
RUN rm -rf /usr/local/tomcat/webapps/*

# Files copy karein (Standard structure)
COPY web/ /usr/local/tomcat/webapps/ROOT/
COPY src/ /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/
COPY web/WEB-INF/lib/ /usr/local/tomcat/webapps/ROOT/WEB-INF/lib/

EXPOSE 8080
CMD ["catalina.sh", "run"]
