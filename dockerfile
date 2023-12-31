# 使用Node官方镜像作为构建环境
FROM node:lts as build-stage

# 设置工作目录
WORKDIR /createdockerpath

# 复制package.json和package-lock.json
COPY package*.json ./

# 安装项目依赖
RUN npm install

# 复制项目文件到工作目录
COPY . .

# 构建应用
RUN npm run build

# 使用Nginx官方镜像作为运行环境
FROM nginx:stable-alpine as production-stage

# 从构建阶段复制构建好的文件到Nginx目录
COPY --from=build-stage /createdockerpath/dist /usr/share/nginx/html

# 暴露80端口
EXPOSE 80

# 启动Nginx，并且保持前台运行
CMD ["nginx", "-g", "daemon off;"]
