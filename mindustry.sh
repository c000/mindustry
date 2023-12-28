#!/bin/sh
#
exec sudo docker compose exec -it server java -jar server-release.jar
