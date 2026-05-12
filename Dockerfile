# Tomcat 10.1 use karein (Ye crash nahi hoga)
FROM tomcat:10.1-jdk17-openjdk-slim

# Purane webapps saaf karein
RUN rm -rf /usr/local/tomcat/webapps/*

# Libraries copy karein (Jo image_d444b6.png mein hain)
COPY web/WEB-INF/lib/ /usr/local/tomcat/webapps/ROOT/WEB-INF/lib/

# JSP support ke liye ye 2 libraries extra dalni pad sakti hain agar error aaye
# Abhi ke liye normal structure copy karte hain
COPY web/ /usr/local/tomcat/webapps/ROOT/
COPY src/ /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/

EXPOSE 8080
CMD ["catalina.sh", "run"]
