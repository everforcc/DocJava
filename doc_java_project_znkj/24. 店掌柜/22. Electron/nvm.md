<span  style="font-family: Simsun,serif; font-size: 17px; ">

- 统一领吗
- ubuntu 安装指定版本 nodejs

### 安装 nvm

~~~
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
~~~

~~~
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash     
~~~

### 加载 nvm

- 为了使 nvm 命令在当前会话中可用，需要运行以下命令
~~~
     export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
     [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
     
~~~
- 你也可以将上述命令添加到你的 ~/.bashrc 或 ~/.zshrc 文件中，以便每次打开终端时自动加载 nvm：
~~~
     echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"' >> ~/.bashrc
     echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.bashrc
     source ~/.bashrc
     
~~~

### 列出可用的 Node.js 版本

- 运行以下命令来查看所有可用的 Node.js 版本：

~~~
nvm ls-remote     
~~~

### 安装指定版本的 Node.js

- 选择你需要的版本并安装。例如，要安装 Node.js 14.17.0，运行：
~~~
nvm install 14.17.0
~~~
- 例如
~~~
nvm install 18.20.8
~~~

### 使用指定版本的 Node.js

- 安装完成后，你可以使用以下命令来切换到指定版本：

~~~
 nvm use 14.17.0
~~~
~~~
 nvm use 18.20.8
~~~

### 6. 验证安装

~~~
     node -v
     npm -v
~~~



</span>