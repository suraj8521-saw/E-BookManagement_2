# Tomcat 10.1 use karein jo bug-free hai
FROM tomcat:10.1-jdk17-openjdk-slim

# Purane webapps folder ko saaf karein
RUN rm -rf /usr/local/tomcat/webapps/*

# 1. Pura 'web' folder copy karein 'webapps-javaee' mein
# Tomcat 10 isse automatically 'jakarta' mein convert kar dega
COPY web/ /usr/local/tomcat/webapps-javaee/ROOT/

# 2. Src folder (Java classes) ko copy karein
# Isse compilation errors (Only a type can be imported) khatam ho jayengi
COPY src/ /usr/local/tomcat/webapps-javaee/ROOT/WEB-INF/classes/

# 3. Saari JAR libraries copy karein (Jo image_d43a6a.png mein dikh rahi hain)
COPY web/WEB-INF/lib/ /usr/local/tomcat/webapps-javaee/ROOT/WEB-INF/lib/

EXPOSE 8080

# Logging manager set karein
ENV JAVA_OPTS="-Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager"

CMD ["catalina.sh", "run"]
