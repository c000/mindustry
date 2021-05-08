from busybox as downloader

RUN wget https://github.com/Anuken/Mindustry/releases/download/v126.2/server-release.jar

from openjdk:17-slim

COPY --from=downloader server-release.jar ./

EXPOSE 6567/tcp
EXPOSE 6567/udp
ENTRYPOINT ["java", "-jar", "server-release.jar"]
