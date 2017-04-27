#!/bin/bash

hexo g
hexo d

time=`date +"%Y%m%d %H:%M:%S"`
git add --all
git commit -m "up $time"
git push origin master
