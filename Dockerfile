# Tomcat 10.1 use karein (Ye crash nahi hoga)
FROM tomcat:10.1-jdk17-openjdk-slim

# Purane files saaf karein
RUN rm -rf /usr/local/tomcat/webapps/*

# Pura 'web' folder copy karein
COPY web/ /usr/local/tomcat/webapps/ROOT/

# Java classes copy karein
COPY src/ /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/

# External libraries (JARs) copy karein
COPY web/WEB-INF/lib/ /usr/local/tomcat/webapps/ROOT/WEB-INF/lib/

# EK ZAROORI STEP: 
# Tomcat 10 ko batana ki hum purana 'javax' code use kar rahe hain
# (Iske liye hum deployment se pehle webapps-javaee folder ka sahara le sakte hain agar error aaye)

EXPOSE 8080
CMD ["catalina.sh", "run"]
