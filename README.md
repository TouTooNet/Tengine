# Tengine Aliyun

> Tengine 的镜像


### 相关功能
- 使用了 Ubuntu:14.04 为基础镜像
- 使用了 Aliyun 的源, 解决ubuntu 国外（欧洲）源访问速度问题
- 使用zsh
- 配置了 Vim, 加入了常用的基础配置
- 安装了Supervisor
- 使用了 LUAJIT 进行解析lua
- 使用 ngx_lua 提供 nginx lua 支持
- 安装了 tengine2.1.2版本

### 使用方法

1、pull 

```
docker pull simman/tengine
```

2、build

```
docker build -t="tengine" .
```

3、run

`./up.sh`

```
Usage:
start:    startup tengine
restart:  restart tengine
stop:     stop tengine
```
