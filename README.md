# chatbot-neo4j
关于聊天机器人的系统
## 启动
```
docker compose -f docker/docker-compose.dev.yml --env-file src/.env up --build
sudo docker compose -f docker/docker-compose.dev.yml up --build
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
```
# 停止所有容器但不删除它们
sudo docker compose -f docker/docker-compose.dev.yml stop

# 或者
sudo docker compose -f docker/docker-compose.dev.yml pause

# 查看所有容器状态
sudo docker compose -f docker/docker-compose.dev.yml ps

# 启动已停止的容器（不重新构建）
sudo docker compose -f docker/docker-compose.dev.yml start

# 重启容器
sudo docker compose -f docker/docker-compose.dev.yml restart
```
