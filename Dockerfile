# Standard stable tag jo Docker Hub par available hai
FROM tomcat:9.0-jdk17-openjdk-slim

# Purane webapps folder ko saaf karna
RUN rm -rf /usr/local/tomcat/webapps/*

# Pura 'web' folder copy karna
COPY web/ /usr/local/tomcat/webapps/ROOT/

# Java classes copy karna
COPY src/ /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/

# External libraries copy karna (MySQL connection ke liye)
COPY web/WEB-INF/lib/ /usr/local/tomcat/webapps/ROOT/WEB-INF/lib/

EXPOSE 8080
CMD ["catalina.sh", "run"]
