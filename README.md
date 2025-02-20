# chatbot-neo4j
关于聊天机器人的系统
## 启动
```
docker compose -f docker/docker-compose.dev.yml --env-file src/.env up --build
```
## 关闭 docker 服务
```
docker compose -f docker/docker-compose.dev.yml --env-file src/.env down
```
