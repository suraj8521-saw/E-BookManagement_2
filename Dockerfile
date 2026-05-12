# Tomcat 10.1 use karein (Bug-free version)
FROM tomcat:10.1-jdk17-openjdk-slim

# Purane webapps saaf karein
RUN rm -rf /usr/local/tomcat/webapps/*

# 1. Pura 'web' folder copy karein (Standard conversion ke liye)
COPY web/ /usr/local/tomcat/webapps-javaee/ROOT/

# 2. Saari compiled classes copy karein (Package structure ke saath)
# Note: Isse compilation errors (Only a type can be imported) solve ho jayengi
COPY src/ /usr/local/tomcat/webapps-javaee/ROOT/WEB-INF/classes/

# 3. Saari JAR libraries copy karein (Jo image_d43a6a.png mein hain)
COPY web/WEB-INF/lib/ /usr/local/tomcat/webapps-javaee/ROOT/WEB-INF/lib/

EXPOSE 8080

# Environment variables for better logging
ENV JAVA_OPTS="-Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager"

CMD ["catalina.sh", "run"]
