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
## 关于 docker 的网络问题

```
# 配置文件
sudo vi /etc/systemd/system/docker.service.d/http-proxy.conf

[Service]
Environment="HTTP_PROXY=http://localhost:7890"
Environment="HTTPS_PROXY=http://localhost:7890"
Environment="NO_PROXY=localhost,127.0.0.1"

```
