# Stable Tomcat 9
FROM tomcat:9.0-jdk17-corretto

# Purane files delete karo
RUN rm -rf /usr/local/tomcat/webapps/*

# Apni war file ko direct ROOT.war bana kar copy karo
COPY app.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
