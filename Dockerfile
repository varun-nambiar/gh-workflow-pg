FROM maven:3.8.3-openjdk-11

WORKDIR /app

COPY pom.xml .

RUN mvn dependency:go-offline

COPY src/ /app/src/

RUN mvn package -DskipTests

EXPOSE 8080
CMD ["java", "-jar", "target/my-app.jar"]