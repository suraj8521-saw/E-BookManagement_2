# Tomcat 10.1 use karein (Ye crash nahi hota)
FROM tomcat:10.1-jdk17-openjdk-slim

# Purane files saaf karein
RUN rm -rf /usr/local/tomcat/webapps/*

# Step 1: Pura 'web' folder copy karein (Lekin 'webapps-javaee' folder mein)
# Tomcat 10 ka feature hai ki wo 'webapps-javaee' mein rakhi files ko 
# automatically 'javax' se 'jakarta' mein convert kar deta hai
COPY web/ /usr/local/tomcat/webapps-javaee/ROOT/

# Step 2: Java classes copy karein
COPY src/ /usr/local/tomcat/webapps-javaee/ROOT/WEB-INF/classes/

# Step 3: Saari Libraries copy karein (Jo image_d43a6a.png mein dikh rahi hain)
COPY web/WEB-INF/lib/ /usr/local/tomcat/webapps-javaee/ROOT/WEB-INF/lib/

EXPOSE 8080

# Tomcat ko normal mode mein chalne dein, wo conversion khud karega
CMD ["catalina.sh", "run"]
