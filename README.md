# cnwordcloud，一个简单的中文词云生成工具

## 功能描述
该软件包集成了jiebaR和wordcloud2的部分功能，用户可以用一行代码，实现从字符串向量到词云的整个流程（包括分词、删除停用词和数字、排序等）。

## 示例代码
本包的示例代码如下：
```{r}
libary(cnwordcloud)
data(sample_text)
cnwordcloud(sample_text)
```
结果如下：

![example graph]('/img/xispeech.PNG')

*来源：习近平于2019亚洲文明对话上的讲话*


## 使用方法
1. 读入文本文件：
```{r}
library(readr)
text <- read_lines("filename.txt")
```

2. 加载cnwordcloud包：
```{r}
library(cnwordcloud)
```

3. 生成词云：
```{r}
cnwordcloud(text)
```

## 参数设置
cnwordcloud函数有3个参数，分别为：
* text: 必需参数，由用户提供
* stopwords: 停用词表，缺省值为本包集成的1893个中文停用词，由哈工大停用词表、百度停用词表等集合而成
* nwords: 在词云中显示的关键词的上限，缺省值为50

## 改进方向
下一步，我计划将文件读入功能集成到cnwordcloud函数中。该函数将根据用户提供的参数进行判断，是读入文件，还是直接从环境中加载字符串矢量。
