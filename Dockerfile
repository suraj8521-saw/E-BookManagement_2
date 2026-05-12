# Railway par sabse stable Tomcat 9 image
FROM tomcat:9-jdk17-openjdk-slim

# Purane webapps folder ko saaf karna
RUN rm -rf /usr/local/tomcat/webapps/*

# Pura 'web' folder copy karna
COPY web/ /usr/local/tomcat/webapps/ROOT/

# Java classes copy karna
COPY src/ /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/

# External libraries copy karna (Database connection ke liye)
COPY web/WEB-INF/lib/ /usr/local/tomcat/webapps/ROOT/WEB-INF/lib/

EXPOSE 8080
CMD ["catalina.sh", "run"]
