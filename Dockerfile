# Stable Tomcat 9 with Java 17
FROM tomcat:9.0-jdk17-corretto

# Purane files hatao
RUN rm -rf /usr/local/tomcat/webapps/*

# Apni .war file ko ROOT.war ke naam se copy karo 
# (Dhyan rakhna ki 'E-BookManagement_2.war' aapki actual war file ka exact naam ho jo GitHub pe upload ki hai)
COPY E-BookManagement_2.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
