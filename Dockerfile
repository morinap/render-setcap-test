FROM eclipse-temurin:11-jre-jammy

RUN apt-get update && apt-get install --no-install-recommends --assume-yes libcap2-bin netcat
RUN setcap 'cap_net_bind_service=+ep' "${JAVA_HOME}/bin/java"

# Listen to keep running for now
EXPOSE 9000
ENTRYPOINT ["nc", "-vv", "-k", "-l", "9000"]
