# Use an official JDK runtime as the base image
FROM openjdk:17-jdk-slim

# Create a volume to persist data (optional, based on app requirements)
VOLUME /tmp

# Argument for the jar file location
ARG JAR_FILE=out/artifacts/com_email_sb_jar/com.email-sb.jar

# Copy the jar file into the container
COPY ${JAR_FILE} app.jar

# Environment variables (replace these with actual values or set them at runtime)
ENV gemini.api.url=https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key= \
    gemini.api.key=AIzaSyCyhMJ_jDAW1LNoFJ37Ty4zgt4Emf1Kjlo

# Expose the application's default port
EXPOSE 8080

# Entry point for the application
ENTRYPOINT ["java", "-jar", "/app.jar"]
