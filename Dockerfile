# Stable Tomcat 9 with Java 17
FROM tomcat:9.0-jdk17-corretto

WORKDIR /usr/local/tomcat

# Purane default pages hatao
RUN rm -rf webapps/*

# 1. Pura web folder copy karo
COPY web/ webapps/ROOT/

# 2. Src folder ko ek temporary location par copy karo
COPY src/ /tmp/src/

# 3. THE REAL COMPILATION FIX: 
# 'lib/*' mein Tomcat ki servlet libraries hain
# 'webapps/ROOT/WEB-INF/lib/*' mein tumhari MySQL/Razorpay libraries hain
RUN mkdir -p webapps/ROOT/WEB-INF/classes && \
    find /tmp/src -name "*.java" > /tmp/sources.txt && \
    javac -cp "lib/*:webapps/ROOT/WEB-INF/lib/*" -d webapps/ROOT/WEB-INF/classes @/tmp/sources.txt

EXPOSE 8080
CMD ["catalina.sh", "run"]
