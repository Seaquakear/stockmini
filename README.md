### stockmini
**一款基于vue2与element-ui开发的股票简易数据展示工具。**


#### 1、运行前准备

下载好下项目后，先执行npm install命令，来下载项目需要用到的包，可能有130MB左右的包。
```
npm install
```

#### 2、运行项目

输入命令：npm run serve来运行项目，项目运行起来后效果如图所示。
```
npm run serve
```
![image](https://github.com/Seaquakear/stockmini/assets/32725087/64614bc9-4525-4aba-8ae3-4a9872427742)
![image](https://github.com/Seaquakear/stockmini/assets/32725087/99e8494d-f629-4b59-b3d7-d0d754126a13)


#### 3、功能说明

这个工具就两个页面，首页上输入股票代码，点击提交按钮，即可获取对应股票的实时数据。如果有多个股票，则以英文逗号做分割。

盲猜页面有两个输入框，分别输入股票代码和购买的份额，比如买了1000股比亚迪的股票，那么就输入002546和1000，再点击提交即可，这时候页面上的表情包会根据当前的盈亏，来显示不同的表情包，内置了5张表情，分别表示默认图片、盈利大于500、盈利大于1000、盈利小于500和盈利小于1000，这一块可以自行添加表情包和改动判断逻辑。
![image](https://github.com/Seaquakear/stockmini/assets/32725087/32adad88-a0fe-4240-bd02-5f8e555d6e82)


#### 4、Docker部署

目前该工具已经发布至Docker Hub上，可以执行以下命令来拉取镜像
```
docker push mycodenobug2/dev:4
```
发布容器并映射到1213端口上运行：

```
docker run -d -p 1213:80 mycodenobug2/dev:4
```
