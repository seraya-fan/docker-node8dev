# docker-node8dev

本Docker环境基于官方Node 8 版本，安装如下的Node组件：

* nrm 默认使用taobao镜像
* npm 更新npm到最新版本
* cnpm 安装CNPM

端口默认提供：8080， 可以使用NODE_PORT更改。

另外，面向Node App提供如下参数：

* dev  NODE_ENV=development & npm run dev
* start NODE_ENV=production & npm run start
* bulid npm run build
* test NODE_ENV=testing & npm run test

其他， 可以运行自定义命令
# Run custom command. Thanks to this line we can still use
# "docker run our_image /bin/bash" and it will work  