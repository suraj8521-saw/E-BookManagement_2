# Railway ke naye Linux environment ke liye sabse stable Tomcat 9
FROM tomcat:9.0-jdk17-corretto

WORKDIR /usr/local/tomcat

# Purane files delete karein
RUN rm -rf webapps/*

# 1. Pura web folder copy karein (Standard Tomcat 9 structure)
COPY web/ webapps/ROOT/

# 2. Pura src folder (Compiled classes) copy karein
COPY src/ webapps/ROOT/WEB-INF/classes/

# 3. Libraries copy karein
COPY web/WEB-INF/lib/ webapps/ROOT/WEB-INF/lib/

EXPOSE 8080
CMD ["catalina.sh", "run"]
