@echo off
docker compose -f docker-compose.radio.yml up
docker compose -f docker-compose.radio.yml down
pause
