# Tomcat 10.1 (Latest Stable)
FROM tomcat:10.1-jdk17-openjdk-slim

# Purane files saaf karein
RUN rm -rf /usr/local/tomcat/webapps/*

# 1. 'web' folder copy karein conversion ke liye
COPY web/ /usr/local/tomcat/webapps-javaee/ROOT/

# 2. 'src' folder (Java files) copy karein
COPY src/ /usr/local/tomcat/webapps-javaee/ROOT/WEB-INF/classes/

# 3. Libraries force copy karein
COPY web/WEB-INF/lib/ /usr/local/tomcat/webapps-javaee/ROOT/WEB-INF/lib/

# 4. Compiled classes agar local pe build ki hain toh unhe bhi copy karein
# Note: Agar build/classes folder hai toh ye zaroori hai
COPY build/web/WEB-INF/classes/ /usr/local/tomcat/webapps-javaee/ROOT/WEB-INF/classes/ 2>/dev/null || :

EXPOSE 8080
CMD ["catalina.sh", "run"]
