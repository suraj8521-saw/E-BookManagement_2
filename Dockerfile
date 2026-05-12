# JDK 17 use karein jo containerized environments mein zyada stable hai
FROM tomcat:9.0-jdk17-openjdk-slim

# Purane webapps folder ko saaf karna
RUN rm -rf /usr/local/tomcat/webapps/*

# Pura 'web' folder copy karna (JSP, CSS, images ke liye)
COPY web/ /usr/local/tomcat/webapps/ROOT/

# Compiled Java classes ko sahi jagah copy karna
COPY src/ /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/

# Agar koi JAR files hain toh unhe yahan copy karein
# Note: Agar ye folder empty hai toh is line ko remove kar sakte hain
COPY web/WEB-INF/lib/ /usr/local/tomcat/webapps/ROOT/WEB-INF/lib/

EXPOSE 8080
CMD ["catalina.sh", "run"]
