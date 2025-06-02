@echo off
docker compose -f docker-compose.tv.yml up
docker compose -f docker-compose.tv.yml down
pause
