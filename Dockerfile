# Tomcat 10.1 (Stable Version)
FROM tomcat:10.1-jdk17-openjdk-slim

# Default apps saaf karein
RUN rm -rf /usr/local/tomcat/webapps/*

# 1. Pura project folder 'webapps-javaee' mein dalo
# Tomcat 10 isse automatically 'javax' se 'jakarta' mein convert kar dega
COPY web/ /usr/local/tomcat/webapps-javaee/ROOT/

# 2. Src folder ko classes mein dalo (Imports resolution ke liye)
COPY src/ /usr/local/tomcat/webapps-javaee/ROOT/WEB-INF/classes/

# 3. JAR Libraries copy karein (Jo image_d43a6a.png mein hain)
COPY web/WEB-INF/lib/ /usr/local/tomcat/webapps-javaee/ROOT/WEB-INF/lib/

EXPOSE 8080
CMD ["catalina.sh", "run"]
