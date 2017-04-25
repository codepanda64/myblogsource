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

## 下载MSYS2
32位下载  [msys2-i686-latest.exe](
http://repo.msys2.org/distrib/msys2-i686-latest.exe),64位下载 [msys2-x86_64-latest.exe](http://repo.msys2.org/distrib/msys2-x86_64-latest.exe)

## 安装MSYS2
下载后得到exe文件双击进入安装向导

![安装向导](http://7xuhei.com2.z0.glb.qiniucdn.com/17-4-24/5549947-file_1493014843815_c9d.png)

选择安装路径

![选择安装目录](http://7xuhei.com2.z0.glb.qiniucdn.com/17-4-24/99443283-file_1493014934370_dfc6.png)

<!-- more -->

接着基本下一步、下一步就完成了

![开始菜单快捷方式](http://7xuhei.com2.z0.glb.qiniucdn.com/17-4-24/91413221-file_1493014987625_5723.png)

![正在安装ing](http://7xuhei.com2.z0.glb.qiniucdn.com/17-4-24/89731114-file_1493015021125_a16e.png)

![安装完成](http://7xuhei.com2.z0.glb.qiniucdn.com/17-4-24/89103495-file_1493015124535_97bf.png)

![退出安装向导](http://7xuhei.com2.z0.glb.qiniucdn.com/17-4-24/95360939-file_1493015165654_ea09.png)

安装好了之后会在菜单栏生产三个命令行工具快捷方式，其中**MSYS2 Shell**是MSYS2系统管理的命令行工具，**MinGW-w64 Win32 Shell**和**MinGW-w64 Win64 Shell**分别是32位和64位下的**MinGW**

## 配置国内源(科大源)
编辑 /etc/pacman.d/mirrorlist.mingw32 ，在文件开头添加：

```
Server = http://mirrors.ustc.edu.cn/msys2/mingw/i686
```

编辑 /etc/pacman.d/mirrorlist.mingw64 ，在文件开头添加：

```
Server = http://mirrors.ustc.edu.cn/msys2/mingw/x86_64
```

编辑 /etc/pacman.d/mirrorlist.msys ，在文件开头添加：
```
Server = http://mirrors.ustc.edu.cn/msys2/msys/$arch
```

然后执行 pacman -Sy 刷新软件包数据即可。

## 更新MSYS2系统环境
运行`msys2_shell.bat`会出现类似linux的bash界面，如果熟悉的肯定不会陌生。

![msys2 shell运行界面](http://7xuhei.com2.z0.glb.qiniucdn.com/17-4-24/65995977-file_1493015300079_11741.png)

`mysys2`使用`pacman`包管理系统，用过[*Arch* *Linux*](https://www.archlinux.org/)对他肯定不会陌生。

首先更新软件数据库
```
pacman --needed -Sy bash pacman pacman-mirrors msys2-runtime
```
然后退出`msys2_shell.bat`，再启动，更新系统
```
pacman -Syu
```

## 安装基本开发环境和常用工具
```
pacman -S  base-devel  git  mercurial  cvs  wget  p7zip  perl  ruby  python2
```


## 安装 MinGW-w64
### 安装32位
```
pacman -S  mingw-w64-i686-toolchain
```


### 安装64位
```
pacman -S  mingw-w64-x86_64-toolchain
```


# 安装Qt5
**安装32位Qt5和Qt Creator**
**安装64位Qt5和Qt Creator**

