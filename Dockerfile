# Start from an image that already has Java 17 installed
FROM eclipse-temurin:17-jre

# Work inside the /app folder
WORKDIR /app

# Copy the JAR that Maven built into the image
COPY target/app.jar app.jar

# The app listens on port 8080
EXPOSE 8080

# Command that runs when the container starts
ENTRYPOINT ["java", "-jar", "app.jar"]
