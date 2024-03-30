# 任務確認

AI》（答案呈現）
> 文字描述任務以外的所有回答，若使用到程式時一律使用R, 並盡量使用tidyverse語法, 答案以R script呈現。

AI》（任務確認）
> 所有任務請先重新以流暢的文字描述任務，再由我確認是否正確，我回答正確無誤後，才給予答案。對答案想法有疑慮時，要提出來請我𨤳清疑慮。每次回應前都必需重新說明任務的內容。


 - 請AI重新描述一次有助於確定任務沒被誤解

- 若不確定AI的描述是否正確，可以請它給個範例。

AI》（任務描述確認）
> 請給我一個範例說明你所理解的資料結構
  
## 有誤解的任務

AI》
> 將data欄位中的"博士班","碩士班","學士班"加總，data欄位中"學校類別"變成' 大專院校'，使得呈現'大專院校'對應"博士班","碩士班","學士班"

## 重新描述任務

AI》
> `df`是個dataframe裡頭有
> - `博士班`欄位代表博士班學生人數
> - `碩士班`欄位代表碩士班學生人數
> - `學士班`欄位代表學士班學生人數
> - `學校類別`欄位  
> 請計算學校類別為"大專院校"的學生總人數

# 水平合併

下載並引入112學年的資料：

- [大專校院原住民學生及畢業生人數—按等級別與校別分](https://data.gov.tw/dataset/33514)  
- [大專院校校別學生數](https://data.gov.tw/dataset/6231)

## 引入資料

### 112學年大專院校校別學生數

#### 任務1: 只留下"學校名稱"    "日間∕進修別" "等級別" "總計" 欄位

#### 任務2: 計算各校各等級別學生人數

得到各大學各等級別，不分日間/進修別，的學生人數


## 整理資料

## 水平合併

AI》
將result_cleaned與df_filtered進行水平合併：
  - id欄位依據："學校名稱", "等級別"欄位，
  - 合併方式： 保留result_cleaned的所有資料



# 範例程式

```r


# 引入大專院校學生人數----
library(readr)
df_all <- read_csv("112_student.csv")

library(dplyr)

## 計算各校各學制學生人數----
result <- df_all %>%
  group_by(學校名稱, 等級別) %>%
  summarise(總計加總 = sum(總計))
  
print(result)

## "等級別"欄位英文、數字及空白 ----
library(tidyverse)

# 假設result是您的資料框
result_cleaned <- result %>%
  mutate(等級別 = str_remove_all(等級別, "[A-Za-z0-9\\s]"))

# 印出修改後的結果
print(result_cleaned)

# 引入原住民學生數----
library(readr)
df_native <- read_csv("112native_A1-1.csv")

## 所有欄位名稱有出現"在學學生人數_"或"班"都從名稱中移除-----
library(tidyverse)

# 假設df_native是您的資料框
df_cleaned <- df_native %>%
  rename_all(~gsub("在學學生人數_|班", "", .))

# 印出修改後的結果
print(df_cleaned)

## `df_cleaned`轉換為長格式 -----
library(tidyr)

# 假設df_cleaned是您的資料框
df_long <- df_cleaned %>% 
  pivot_longer(cols = c("博士", "碩士", "學士", "二專", "五專"), 
               names_to = "等級別", values_to = "原住民學生數")

# 印出修改後的結果
print(df_long)

## 只保留 "學校名稱"、"等級別" 和 "原住民學生數" 這三個欄位----
library(dplyr)

# 假設df_long是您的資料框
df_filtered <- df_long %>%
  select(學校名稱, 等級別, 原住民學生數)

# 印出修改後的結果
print(df_filtered)

# 合併----
library(tidyverse)

# 假設result_cleaned (左）和df_filtered（右）是您的資料框
merged_data <- left_join(result_cleaned, df_filtered, by = c("學校名稱", "等級別"))

# 印出合併後的結果
print(merged_data)
```