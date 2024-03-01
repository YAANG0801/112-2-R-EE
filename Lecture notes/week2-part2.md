# Goals

1. Frame a proper prompt for AI 
2. Verify the AI response

## Task

> I have a data from ..., and I want to know ...

## 選舉開票結果

> 我有一個各里投票結果的資料，我想知道每個里最支持哪個候選人

*** 

```
要找出每個里最支持的候選人，可以透過統計每個里投票結果中各候選人得票數最多的候選人。以下是一個簡單的步驟，幫助你找出每個里最支持的候選人：

1. 首先，將投票結果資料整理成一個表格，將每個里的名稱和投票結果列在表格中。

2. 接著，遍歷每個里的投票結果，找出每個里中得票數最多的候選人。

3. 將每個里中得票數最多的候選人整理成一個新的表格或清單，這樣就可以清楚地知道每個里最支持的候選人了。

這樣就能方便快速地找出每個里最支持的候選人了。希望這個方法對你有所幫助！
```

沒有程式說明幫你做這件事情，但是：

```
1. (Done) 
2. Not yet.
```

> 如何把https://docs.google.com/spreadsheets/d/19iDkioNuPbHpIGdCVX-oI9wFtgtqOWWU0WXgLAWMxg8/edit#gid=1091784981中的「選舉開票結果」表單引入R


***

要將位於 https://docs.google.com/spreadsheets/d/19iDkioNuPbHpIGdCVX-oI9wFtgtqOWWU0WXgLAWMxg8/edit#gid=1091784981 的"選舉開票結果"表單引入R，你可以使用googlesheets套件和進階功能進行操作。以下是一個示例：

1. 首先，在R中安裝並載入googlesheets套件：
```R
install.packages("googlesheets")
library(googlesheets)
```

2. 使用gs_key()函數來指定Google Sheets的ID，然後讀取該文件的內容：
```R
sheet_id <- "19iDkioNuPbHpIGdCVX-oI9wFtgtqOWWU0WXgLAWMxg8"  # 使用表單的ID
my_sheet <- gs_key(sheet_id)
my_data <- gs_read(my_sheet, ws = "選舉開票結果")  # 讀取指定的工作表
```

這樣就能將位於指定Google Sheets中的"選舉開票結果"表單引入到R中的my_data數據框。希望這能幫助你成功將資料引入R中！