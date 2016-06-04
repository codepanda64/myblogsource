---
title: Windows下安装MSYS2+MinGW-w64+Qt5
date: 2016-02-21 19:59
updated: 2016-05-24 00:53
tags: 
  - MSYS2
  - MinGW
  - Qt5
categories: 
  - Qt
comments: true
---

# 下载MSYS2
32位下载  [msys2-i686-20150916.exe](
http://repo.msys2.org/distrib/i686/msys2-i686-20150916.exe),64位下载 [msys2-x86_64-20150916.exe](http://repo.msys2.org/distrib/x86_64/msys2-x86_64-20150916.exe)

# 安装MSYS2
下载后得到exe文件双击进入安装向导

![安装向导](http://i4.buimg.com/f068ce37b561f1ad.png)

选择安装路径

![选择安装目录](http://i4.buimg.com/1315ce116029c244.png)

<!-- more -->

接着基本下一步、下一步就完成了

![正在安装ing](http://i4.buimg.com/b5b288e399dc781a.png)

![安装完成](http://i4.buimg.com/a0c4285479991756.png)

![退出安装向导](http://i4.buimg.com/470dc71b71e3abd4.png)

安装好了之后会在菜单栏生产三个命令行工具快捷方式，其中**MSYS2 Shell**是MSYS2系统管理的命令行工具，**MinGW-w64 Win32 Shell**和**MinGW-w64 Win64 Shell**分别是32位和64位下的**MinGW**

![开始菜单栏添加的快捷方式](http://i2.buimg.com/9d79337a8742e5da.png)


# 更新MSYS2系统环境
运行`msys2_shell.bat`会出现类似linux的bash界面，如果熟悉的肯定不会陌生。

![msys2 shell运行界面](http://i2.buimg.com/f48e2b59579ef37f.png)

`mysys2`使用`pacman`包管理系统，用过[*Arch* *Linux*](https://www.archlinux.org/)对他肯定不会陌生。

首先更新软件数据库
```
pacman --needed -Sy bash pacman pacman-mirrors msys2-runtime
```
然后退出`msys2_shell.bat`，再启动，更新系统
```
pacman -Syu
```

![更新系统](http://i2.buimg.com/f3828a44597427bc.png)

# 安装基本开发环境和常用工具
```
pacman -S  base-devel  git  mercurial  cvs  wget  p7zip  perl  ruby  python2
```

![安装常用工具](http://i2.buimg.com/8168e0dd4b45033e.png)


# 安装 MinGW-w64
## 安装32位
```
pacman -S  mingw-w64-i686-toolchain
```
![安装mingw-w64-i686-toolchain](http://i2.buimg.com/2e9f5b73daf188cc.png)

## 安装64位
```
pacman -S  mingw-w64-x86_64-toolchain
```

![安装mingw-w64-x86_64-toolchain](http://i2.buimg.com/20a27c56eb3d94b9.png)

# 安装Qt5
**安装32位Qt5和Qt Creator**
**安装64位Qt5和Qt Creator**
![安装64位Qt5和Qt Creator](http://i2.buimg.com/fc2fdeddd305f26c.png)
