# 使用基础镜像
FROM pytorch/pytorch:2.4.1-cuda11.8-cudnn9-runtime

# 设置工作目录
WORKDIR /app

# 复制 requirements.txt 文件（这一步如果文件没变，Docker 会使用缓存）
COPY ../requirements.txt /app/requirements.txt

# 安装依赖（Docker 会缓存这一步，除非 requirements.txt 发生变化）
RUN pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

RUN pip install -U gunicorn -i https://pypi.tuna.tsinghua.edu.cn/simple

RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN sed -i s@/security.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN apt-get clean
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y

# 复制代码到容器中
COPY ../src /app/src

