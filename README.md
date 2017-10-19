# 这个项目用来读取 Excel 表格内容的(不是加载显示), 类型包括csv,xls,xlsx

## 项目从这个地址pull的: https://github.com/poos/ExcelParseForIOS
## 对其中一些bug 修复, 同时整理一下资料

```
修复xlsx
1. 修复当Excel表格下的sheet被命名过的情况下读取错误
2. 修复某些情况下数据顺序错乱情况
```


#### 1.解析csv
即逗号分隔值，其文件以纯文本形式存储表格数据（数字和文本）。文本解析

#### 2.解析 xls：
通过 DHxlsReader 框架和 libxls库 来实现解析
https://github.com/shaojiankui/Excel2JSON-Demo

#### 3.解析xlsx
最初的作者应该是
http://download.csdn.net/download/zjn640322/9613147#comment
但是工程有一些bug , 作者没有上传到github所以也没法提交Lssues

其实最初是down的这个修改bug(调了几个小时,有一种柳暗花明的感觉), 后来结合时候才找到本文作者的demo, 很不错, 推荐. 另外bug也提交給他了

另外推荐一个OC解析和导出excel的库: https://github.com/renebigot/XlsxReaderWriter

---
xlsx 解压后是一些xml文档

解析如下
1. sharedString.xml 用于保存所有的excel表格中格子的值, 相当于一个有序的不重复的数组(不保存数值类型)
2. 其他的sheet1.xml, sheet2.xml...是单独的xml文件, 其中每个格子按顺序0,1,2...对应sharedString.xml中的值, 但是数值类型会直接给出值(有一个标志)

这样做应该是为了压缩文件占用的大小, 毕竟通常excel中的很多格子的数值都是一样的

---
