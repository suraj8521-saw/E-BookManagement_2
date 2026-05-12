# Tomcat 9.0.89 use karein jo modern infrastructure (cgroupv2) compatible hai
FROM tomcat:9.0.89-jdk17-openjdk-slim

# Purane webapps folder ko saaf karna
RUN rm -rf /usr/local/tomcat/webapps/*

# Pura 'web' folder copy karna
COPY web/ /usr/local/tomcat/webapps/ROOT/

# Compiled Java classes ko copy karna
COPY src/ /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/

# External libraries (JARs) copy karna (Bohot zaroori hai classes milne ke liye)
COPY web/WEB-INF/lib/ /usr/local/tomcat/webapps/ROOT/WEB-INF/lib/

EXPOSE 8080
CMD ["catalina.sh", "run"]
