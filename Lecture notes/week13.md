# Recap

## 各學年資料合併

  - [主程式](./week12.md#範例程式合併多年)  
  - [支援程式merge.R](https://github.com/tpemartin/112-2-R-EE/blob/main/Lecture%20notes/merge.R)
  
> 進行stack data前要先移除有問題的109學年資料：
> ```r
> # 移除109 -----
>
> merged_data_list[["109"]] <- NULL
> ```


# 資料說明

## 整體描述

有多少欄位？有多少筆資料？

## 欄位說明

有多少缺失值？ 佔多少比例？  

### 連續型

全距，平均數，極大值，極小值。
四分位數，中位數。

### 間斷資料

#### 類別型

當類別少於 10 個時，列出：
各類別的數量。  
各類別的比例。  
當類別大於與等於 10 個時，只列出各類別的數量。

#### 純文字


## AI prompt設計

針對data frame進行資料描述遵守以下規則：
1. 先整體描述資料有多少欄位，多少筆資料。再進行逐欄描述。
2. 針對每一個欄位，先描述有多少缺失值，佔多少比例。  
3. 若欄位為連續型，則需描述全距，平均數，極大值，極小值，四分位數，中位數。  
4. 若欄位為間斷資料，先判斷是否低於10類，若低於10類，則需描述各類別的數量，各類別的比例。當類別大於與等於 10 個時，只列出各類別的數量。 
資料描述的各別結果請存在一個list裡並各別給予適當的元素名稱。

# 架構describe_dataFrame函數

以下放到 merge.R   
```r
describe_dataFrame <- function(df){
  # 數據框資料描述 -----
  
  library(tidyverse)
  
  # 假設 df 已存在於環境中
  
  # 整體描述
  total_rows <- nrow(df)
  total_cols <- ncol(df)
  overall_description <- list(
    total_rows = total_rows,
    total_cols = total_cols
  )
  
  # 初始化描述結果列表
  column_descriptions <- list()
  
  # 逐欄描述
  for (col in colnames(df)) {
    # 取得欄位數據
    column_data <- df[[col]]
    
    # 缺失值描述
    missing_count <- sum(is.na(column_data))
    missing_ratio <- missing_count / total_rows
    
    # 建立欄位描述的初始列表
    col_description <- list(
      missing_count = missing_count,
      missing_ratio = missing_ratio
    )
    
    # 連續型資料描述
    if (is.numeric(column_data)) {
      col_description$range <- range(column_data, na.rm = TRUE)
      col_description$mean <- mean(column_data, na.rm = TRUE)
      col_description$max <- max(column_data, na.rm = TRUE)
      col_description$min <- min(column_data, na.rm = TRUE)
      col_description$quantiles <- quantile(column_data, na.rm = TRUE)
      col_description$median <- median(column_data, na.rm = TRUE)
    }
    
    # 間斷資料描述
    if (is.factor(column_data) || is.character(column_data)) {
      levels_count <- length(unique(column_data))
      if (levels_count <= 10) {
        level_counts <- table(column_data)
        level_ratios <- prop.table(level_counts)
        col_description$level_counts <- level_counts
        col_description$level_ratios <- level_ratios
      }
    }
    
    # 添加到描述結果列表
    column_descriptions[[col]] <- col_description
  }
  
  # 結果列表
  description_result <- list(
    overall = overall_description,
    columns = column_descriptions
  )
  
  # 顯示描述結果的概覽
  str(description_result)
  # -----
  return(description_result)
}
```

## 範例程式

```r
# 使用describe_dataFrame-----

source("r/merge.R")

## stacked_data-----
description_result <- describe_dataFrame(stacked_data)

library(tidyverse)

# 假設 stacked_data 已存在於環境中

## 不同學制 -----

# 初始化結果列表
descriptions_by_study_type <- list()

# 取得不同學制類別
study_types <- unique(stacked_data$學制)

# 逐一學制進行描述
for (study_type in study_types) {
  # 過濾出當前學制的資料
  subset_data <- stacked_data %>% filter(學制 == study_type)
  
  # 保存當前學制的描述結果
  descriptions_by_study_type[[study_type]] <- 
    describe_dataFrame(subset_data)
}

# 顯示描述結果的概覽
str(descriptions_by_study_type)
```