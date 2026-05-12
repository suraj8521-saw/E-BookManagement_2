# Tomcat 10.1 Stable
FROM tomcat:10.1-jdk17-openjdk-slim

RUN rm -rf /usr/local/tomcat/webapps/*

# 1. Pura web folder copy karo (Conversion ke liye)
COPY web/ /usr/local/tomcat/webapps-javaee/ROOT/

# 2. Sari libraries copy karo (image_d43a6a.png wali)
COPY web/WEB-INF/lib/ /usr/local/tomcat/webapps-javaee/ROOT/WEB-INF/lib/

# 3. YAHAN DHAYN DO: 
# Agar tumhare pass compiled classes hain, toh unhe force copy karo
COPY build/web/WEB-INF/classes/ /usr/local/tomcat/webapps-javaee/ROOT/WEB-INF/classes/ 2>/dev/null || :

# Agar classes nahi hain, toh src ko hi classes folder bana do (JSP compiler ke liye)
COPY src/ /usr/local/tomcat/webapps-javaee/ROOT/WEB-INF/classes/

EXPOSE 8080
CMD ["catalina.sh", "run"]
