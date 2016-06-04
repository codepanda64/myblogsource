---
title: Python基础——list详解
date: 2014-07-20 21:15
updated: 2016-05-18 00:53
tags: 
 - Python基础
 - Python
 - list
categories: 
 - Python
comments: true
---

# list是什么

Python中的list有点像JAVA中的数组和List对象，但使用上更加灵活好用。

# 创建一个list对象

可以使用`[]`里面包含0个或多个元素来创建list，每个元素用`,`分隔，且里面包含元素可以是不同类型的，甚至可以用`list('abc')`或`'abc'.split()`将一个字符串转变为一个list，如下：
```python
In [1]: l1 = []   #建立一个空list

In [2]: l2 = ['a','b','c']   #建立一个包含'a','b','c'三个元素的list

In [3]: l3 = list('abcdef')  #将一个字符串转为list

In [4]: l3
Out[4]: ['a', 'b', 'c', 'd', 'e', 'f']

In [5]: l3 = 'abcdef'.split()  #将一个字符串转为list

In [6]: l3
Out[6]: ['a', 'b', 'c', 'd', 'e', 'f']

In [26]: l3 = ['a','b',['c','d'],'e'] # list内可以包含另一个list作为其元素
In [27]: l3
Out[27]: ['a', 'b', ['c', 'd'], 'e']
```

<!-- more -->

# 获取list中的元素

获取list中的元素可以使用list的下标获取
```python
In [44]: l3
Out[44]: ['a', 'b', 'c', 'd', 'e', 'f']

In [45]: l3[0]
Out[45]: 'a'

In [46]: l3[1]
Out[46]: 'b'

In [47]: l3[2]
Out[47]: 'c'
```

`len()`函数可以获得list的元素个数
```python
In [44]: l3
Out[44]: ['a', 'b', 'c', 'd', 'e', 'f']

In [48]: len(l3)
Out[48]: 6
```


当我们取的元素下标超过最后一个元素的下标时，会报_IndexError_错误
```python
In [44]: l3
Out[44]: ['a', 'b', 'c', 'd', 'e', 'f']

In [49]: l3[6]
---------------------------------------------------------------------------
IndexError                                Traceback (most recent call last)
<ipython-input-49-b9e71dcfd3ba> in <module>()
----> 1 l3[6]

IndexError: list index out of range
```

list最后一个元素的下标是`len(list)-1`
list可以用负整数表示下标，`-1`表示最后一个元素，`-2`表示倒数第二个，以此类推。
```python
In [44]: l3
Out[44]: ['a', 'b', 'c', 'd', 'e', 'f']

In [51]: l3[-1]
Out[51]: 'f'
```

当然负数下标超出list的第一个元素也会引起_IndexError_错误，list的第一个元素的负数下标为`-(len(list))`

# 添加删除元素

list的`append()`方法可以将一个元素加到list尾部
```python
In [8]: l4 = [1]

In [9]: l4
Out[9]: [1]

In [10]: l4.append(2)

In [11]: l4
Out[11]: [1, 2]
```

`extend()`方法可以将另一个list加到当前list的尾部
```python
In [12]: l4.extend([3,4,5])

In [13]: l4
Out[13]: [1, 2, 3, 4, 5]
```

`insert()`方法可以将元素插入到list的指定位置
```python
In [18]: l4.insert(2,10)

In [19]: l4
Out[19]: [1, 2, 10, 3, 4, 5]
```

`pop()`方法可以将尾部的元素删除，并返回这个元素
```python
In [20]: l4.pop()
Out[20]: 5

In [21]: l4
Out[21]: [1, 2, 10, 3, 4]
```

`remove()`方法可以将指定元素移除
```python
In [21]: l4
Out[21]: [1, 2, 10, 3, 4]

In [22]: l4.remove(3)

In [23]: l4
Out[23]: [1, 2, 10, 4]
```

`del`函数可以删除指定位置或指定切片（稍后讨论）的元素，甚至删除整个list
```python
In [25]: l4
Out[25]: [1, 2, 10, 4]

In [26]: del l4[2]    #删除位置在2的元素

In [27]: l4
Out[27]: [1, 2, 4]

In [28]: del l4[1:]   #删除位置1及以后的所有元素

In [29]: l4
Out[29]: [1]

In [30]: del l4    #删除整个l4

In [31]: l4   #再调用l4会报错未定义
---------------------------------------------------------------------------
NameError                                 Traceback (most recent call last)
<ipython-input-31-f74ac48e0007> in <module>()
----> 1 l4

NameError: name 'l4' is not defined
```

# 强大而灵活的切片功能

list利用切片功能可以很方便的取出部分或全部的元素
```python
In [33]: l5
Out[33]: ['a', 'b', 'c', 'd', 'e', 'f', 'g']

In [34]: l5[1:4]
Out[34]: ['b', 'c', 'd']
```

`l5[1:4]`切片出的列表包含开始位置`1`的元素`b`，但不包含结束位置`4`的元素。
当然也可以只给出开始位置或只给出结束位置，甚至开始位置和结束位置都不给，只用一个`:`，表示整个list，如：
```python
In [38]: l5[1:]   #表示位置为1及以后的所有元素
Out[38]: ['b', 'c', 'd', 'e', 'f', 'g']

In [42]: l5[:4] #表示位置4以前的所有元素，注意不包含位置4的元素
Out[42]: ['a', 'b', 'c', 'd']

In [43]: l5[:]  #表示整个l5
Out[43]: ['a', 'b', 'c', 'd', 'e', 'f', 'g']

In [60]: l5[:100]  #切片时下标越界并不会报错，python会自动取范围之内的元素
Out[60]: ['a', 'b', 'c', 'd', 'e', 'f', 'g']

```

负数下标做切片也是可行的
```python
In [55]: l5
Out[55]: ['a', 'b', 'c', 'd', 'e', 'f', 'g']

In [56]: l5[:-1]
Out[56]: ['a', 'b', 'c', 'd', 'e', 'f']

In [57]: l5[:-0]    #切片要想取最后一个元素结束下标就要大于最后一个元素的下标，或者留空，若用负数是不能表示的，-0就是0，所以-0在这里表示0，与想要的效果相去甚远。
Out[57]: []In [7]: 'Tom' not in user
Out[7]: False
```

将切片赋值给另一个变量是对原list元素的一种复制操作,改变赋值后的list的元素并不会影响原来的list
```
In [2]: l5
Out[2]: ['a', 'b', 'c', 'd', 'e', 'f', 'g']

In [3]: l6 = l5[1:3]

In [4]: l6
Out[4]: ['b', 'c']

In [5]: l6[1] = 'z'     #  修改l6中的元素

In [6]: l6
Out[6]: ['b', 'z']   # l6被修改

In [7]: l5
Out[7]: ['a', 'b', 'c', 'd', 'e', 'f', 'g'] #l5未被修改
```

控制步长，list分片还有第三个参数，可以控制分片的步长，不设置默认为`1`
```python
In [9]: l7
Out[9]: [1, 2, 3, 4, 5, 6, 7, 8, 9]

In [10]: l7[0:5]
Out[10]: [1, 2, 3, 4, 5]

In [11]: l7[0:5:2]
Out[11]: [1, 3, 5]
```

分片的步长不能为`0`(这很好理解)，但可以设置为负数，设置为负数时从右向左取元素
```python
In [14]: l7[5:0:-1]
Out[14]: [6, 5, 4, 3, 2]

In [15]: l7[9:3:-2]
Out[15]: [9, 7, 5]

In [16]: l7[::-1]    # 优雅的逆序
Out[16]: [9, 8, 7, 6, 5, 4, 3, 2, 1]
```

可以对分片进行赋值
```python
In [16]: name
Out[16]: ['p', 'e', 'a', 'r']

In [17]: name = list('Mack')

In [18]: name
Out[18]: ['M', 'a', 'c', 'k']

In [19]: name[3:]= list('aulay')

In [20]: name
Out[20]: ['M', 'a', 'c', 'a', 'u', 'l', 'a', 'y']
```

分片赋值可以完成list的插入和删除操作
```python
In [21]: n = [1, 10]

In [22]: n[1:] = [2, 3, 4, 5, 6, 7, 8, 9]

In [23]: n
Out[23]: [1, 2, 3, 4, 5, 6, 7, 8, 9]

In [24]: n[1:8] = []

In [25]: n
Out[25]: [1, 9]
```

# list中的`+`和`*`

两个list可以使用数学运算符`+`，表示将两个list连接成一个大的list
```python
In [17]: l8 = [1, 2, 3]

In [18]: l9 = [4, 5, 6]

In [19]: l8 + l9
Out[19]: [1, 2, 3, 4, 5, 6]
```

list可以与一个整数使用运算符`*`，表示将list重复n次，形成一个大的list（n是`*`的整数）
```python
In [17]: l8 = [1, 2, 3]

In [21]: l8 * 3
Out[21]: [1, 2, 3, 1, 2, 3, 1, 2, 3]
```

这个方法在初始化一个list，或是排版打印输出时十分有用
```python
In [24]: l10 = [0]*10

In [25]: l10
Out[25]: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

In [26]: l11 = [None]*10  #使用None作为占位符

In [27]: l11
Out[27]: [None, None, None, None, None, None, None, None, None, None]
```

下面这个例子摘自《Python基础教程（第2版）》，利用list的`*`运算很好的解决排版打印问题
```python
sentence = raw_input("Sentence: ")

screen_width = 80
text_width = len(sentence)
box_width = text_width + 6
left_margin = (screen_width - box_width) // 2

print
print ' ' * left_margin + '+'  + '-' * (box_width-4) +  '+'
print ' ' * left_margin + '| ' + ' ' * text_width    + ' |'
print ' ' * left_margin + '| ' +       sentence      + ' |'
print ' ' * left_margin + '| ' + ' ' * text_width    + ' |'
print ' ' * left_margin + '+'  + '-' * (box_width-4) +  '+'
print

#输出结果
Sentence: He's a very naughty boy!

                         +--------------------------+
                         |                          |
                         | He's a very naughty boy! |
                         |                          |
                         +--------------------------+
```

# `in`和`not in`

python的list可以使用`in`运算检查某个元素在不在一个list中，存在返回`True`，不存在返回`False`，`not in`则反之。
```python
In [5]: user = ['Tom', 'Mack', 'Lee']

In [6]: 'Tom' in user
Out[6]: True

In [7]: 'Tom' not in user
Out[7]: False
```

# list的其他一些方法

`count()`方法，负责统计list中某个元素出现的次数，此方法返回查找元素出现的次数
```python
In [28]: user = ['Mac', 'Lee', 'Jack', 'Tom', 'Lee']

In [29]: user.count('Lee')
Out[29]: 2
```

`index()`方法，找到某个值在list中第一个匹配元素的索引位置，此方法返回第一个匹配元素索引的位置
```python
In [28]: user = ['Mac', 'Lee', 'Jack', 'Tom', 'Lee']

In [30]: user.index('Lee')
Out[30]: 1
```

`reverse()`方法，将一个list逆序存放，此方法修改了原来的list，并返回一个迭代器对象
```python
In [31]: n = [1, 2, 3]

In [32]: n.reverse() #reverse方法返回的是一个迭代器对象，并非list对象

In [35]: n
Out[35]: [3, 2, 1]
```

`sort()`方法，将list按照一定规则将里面的元素重新排序，此方法修改了原来的list，若想要保留原有的list，则需要先建立list的副本，使用副本调用此方法,此方法没有返回值。当然也可以调用函数`sorted()`，此函数不改变原list，返回排序好的list
```python
In [36]: n = [100, 102, 99, 87, 1, 2, 56]

In [37]: n.sort()

In [38]: n
Out[38]: [1, 2, 56, 87, 99, 100, 102]

#使用副本调用sort()
In [39]: n = [100, 102, 99, 87, 1, 2, 56]

In [40]: m = n[:]

In [41]: m
Out[41]: [100, 102, 99, 87, 1, 2, 56]

In [42]: m.sort()

In [43]: m
Out[43]: [1, 2, 56, 87, 99, 100, 102]

In [44]: n
Out[44]: [100, 102, 99, 87, 1, 2, 56]

#使用sorted()函数返回排序好的list
In [45]: m2 = sorted(n)

In [46]: m2
Out[46]: [1, 2, 56, 87, 99, 100, 102]
```


`sort()`方法包括几个可选参数，`cmp`、`key`、`reverse`。
`cmp`参数可以允许你提供一个比较函数，根据提供的比较函数来进行排序，函数不许遵循一定的规范，例如：`compare(x, y)`，当`x < y`时，返回负数，当`x > y`时返回正数，当`x == y`时返回`0`
```python
In [44]: n
Out[44]: [100, 102, 99, 87, 1, 2, 56]

#定义compare()函数
In [47]: def compare(x, y):
   ....:     if x < y:
   ....:         return -1
   ....:     elif x > y:
   ....:         return 1
   ....:     elif x == y:
   ....:         return 0


In [48]: n.sort(compare)

In [49]: n
Out[49]: [1, 2, 56, 87, 99, 100, 102]
```

`key`参数和`cmp`参数类似，可以提供一个函数，这个函数为每个元素生成一个键，然后根据元素的键来排序。比如：
```python
In [52]: user.sort(key=len) #根据元素的长度排序

In [53]: user
Out[53]: ['Mac', 'Lee', 'Tom', 'Lee', 'Jack']
```

`reverse`参数是一个`Boolean`类型的参数，当设置为`True`时，表示反向排序
```python
In [55]: m
Out[55]: [1, 2, 56, 87, 99, 100, 102]

In [56]: m.sort(reverse=True)

In [57]: m
Out[57]: [102, 100, 99, 87, 56, 2, 1]
```
