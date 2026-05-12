# Tomcat 10.1 JDK 17 (Stable)
FROM tomcat:10.1-jdk17-openjdk-slim

WORKDIR /usr/local/tomcat

# Purane files delete karein
RUN rm -rf webapps/*

# 1. Pura 'web' folder copy karein (isme libraries aur JSP hain)
COPY web/ webapps-javaee/ROOT/

# 2. 'src' folder ko ek temporary folder mein copy karein
COPY src/ /tmp/src/

# 3. THE MAGIC STEP: Railway server par hi Java code ko compile karein
# Ye step saari .java files dhundega aur unhe .class mein convert karke sahi jagah daal dega
RUN mkdir -p webapps-javaee/ROOT/WEB-INF/classes && \
    find /tmp/src -name "*.java" > /tmp/sources.txt && \
    javac -cp "webapps-javaee/ROOT/WEB-INF/lib/*" -d webapps-javaee/ROOT/WEB-INF/classes @/tmp/sources.txt

EXPOSE 8080
CMD ["catalina.sh", "run"]
