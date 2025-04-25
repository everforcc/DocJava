<span  style="font-family: Simsun,serif; font-size: 17px; ">

- 更新最新nodejs
- 18

~~~
electron  ubuntu 20.04.6LTS 打包
~~~

- 版本
- ubuntu 20.04.6LTS

- 一般只需要1和3

~~~shell
# 1. 安装环境
npm install electron-builder --save-dev
# 或者
yarn add electron-builder --dev

# 添加到package.json 配置文件
"scripts": {
    "start": "electron .",
    "pack": "electron-builder --dir",
    "dist": "electron-builder"
  },

# 2. 报错才需要安装
sudo npm install electron -g --unsafe-perm=true --allow-root

# 3. 执行这个
npm run dist
# 或者
yarn dist
# 根据自己配置的 znkj 用这个
npm run build:linux
~~~

</span>