# Tomcat 10.1 use karein (Crash fix ke liye)
FROM tomcat:10.1-jdk17-openjdk-slim

# Purane webapps delete karein
RUN rm -rf /usr/local/tomcat/webapps/*

# 1. 'web' folder copy karein (JSP aur static files ke liye)
COPY web/ /usr/local/tomcat/webapps-javaee/ROOT/

# 2. 'src' folder copy karein (Agar Tomcat ko JSP compile karni pade)
COPY src/ /usr/local/tomcat/webapps-javaee/ROOT/WEB-INF/classes/

# 3. JAR Libraries (Jo image_d43a6a.png mein hain)
COPY web/WEB-INF/lib/ /usr/local/tomcat/webapps-javaee/ROOT/WEB-INF/lib/

# 4. CRITICAL STEP: Agar build folder hai toh classes copy karein
# Isse JSP resolution error (Resolves to a package) khatam ho jayegi
COPY build/web/WEB-INF/classes/ /usr/local/tomcat/webapps-javaee/ROOT/WEB-INF/classes/ 2>/dev/null || :

EXPOSE 8080
CMD ["catalina.sh", "run"]
