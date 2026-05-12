# Tomcat 10.1 (Latest Stable)
FROM tomcat:10.1-jdk17-openjdk-slim

# Purane default apps hatao
RUN rm -rf /usr/local/tomcat/webapps/*

# 1. Pura project folder 'webapps-javaee' mein dalo (Tomcat isse khud convert karega)
COPY web/ /usr/local/tomcat/webapps-javaee/ROOT/

# 2. Src folder ko classes mein dalo (TAAKI IMPORTS FAIL NA HO)
COPY src/ /usr/local/tomcat/webapps-javaee/ROOT/WEB-INF/classes/

# 3. Sari Libraries (JARs) force copy karo
COPY web/WEB-INF/lib/ /usr/local/tomcat/webapps-javaee/ROOT/WEB-INF/lib/

EXPOSE 8080
CMD ["catalina.sh", "run"]
