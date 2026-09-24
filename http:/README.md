# Docker Lab 9

Node.js-застосунок, упакований у Docker-контейнер.

## Файли
- `Dockerfile` — (база `node:lts`, порт 3000)
- `.dockerignore` — виключає `node_modules`, `.env` 
- `index.js` — HTTP-сервер, що слухає порт 3000
- `.github/workflows/ci.yml` — пайплайн CI/CD

## Як працює пайплайн
1. Генерує тег образу з хеша останнього коміту (`git rev-parse --short HEAD`)
2. Авторизується в Docker Hub
3. Збирає образ і пушить його в Docker Hub
4. Підключається до EC2 по SSH і запускає новий контейнер

## Локальний запуск
```
docker build -t hrash/nodeapp .
docker run -p 3000:3000 hrash/nodeapp
```
