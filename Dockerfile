# Stable version jo Railway par chalta hai
FROM tomcat:9-jdk17-openjdk-slim

# Purane files delete karein
RUN rm -rf /usr/local/tomcat/webapps/*

# Files copy karein
COPY web/ /usr/local/tomcat/webapps/ROOT/
COPY src/ /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/
COPY web/WEB-INF/lib/ /usr/local/tomcat/webapps/ROOT/WEB-INF/lib/

EXPOSE 8080
CMD ["catalina.sh", "run"]
