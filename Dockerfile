# Tomcat 10 use karein jo modern infrastructure ke liye optimized hai
FROM tomcat:10.1-jdk17-openjdk-slim

# Purane webapps folder ko saaf karna
RUN rm -rf /usr/local/tomcat/webapps/*

# Pura 'web' folder copy karna
COPY web/ /usr/local/tomcat/webapps/ROOT/

# Compiled Java classes ko copy karna
COPY src/ /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/

# Agar external libraries (JARs) hain toh copy karein
COPY web/WEB-INF/lib/ /usr/local/tomcat/webapps/ROOT/WEB-INF/lib/

EXPOSE 8080
CMD ["catalina.sh", "run"]
