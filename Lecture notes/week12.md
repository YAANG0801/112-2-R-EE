# Recap

```
有以下兩個連結：
"https://stats.moe.gov.tw/files/ebook/native/{{year}}/{{year}}native_A1-1.csv"
"https://stats.moe.gov.tw/files/detail/{{year}}/{{year}}_student.csv"
可以下載某個{{year}}的原住民生資料(第一個連結)和全校學生資料(第二個連結). 
```

## 單學年測試水平合併

### 112學年度

> ```令{{year}}=112， 下載並引入這兩個資料集分別取名native112及allStudent112。```

### 身份單位一致性

https://github.com/tpemartin/112-2-R-EE/blob/eefdb757895527f9526271cf926608d7a4a5ffda/Lecture%20notes/week11.md?plain=1#L38-L78


> ```有一個merge_allStudent_native112函數，可以將allStudent112和native112合併，透過merge_allStudent_native112(allStudent112, native112)來呼叫，這個函數放在r/merge.R中, 請將其引入，並使用這個函數合併資料集，結果存在merged_data112中。```


### 104學年度

> ```令{{year}}=104， 下載並引入這兩個資料集分別取名native104及allStudent104。```

```r
glimpse(slice(allStudent104,2))
glimpse(slice(native104,2))
```

#### 總計

```
allStudent104有以下連續欄位：
$ 一年級男生  <int> 655
$ 一年級女生  <int> 754
$ 二年級男生  <int> 569
$ 二年級女生  <int> 655
$ 三年級男生  <int> 346
$ 三年級女生  <int> 431
$ ：
$ 七年級男生  <int> 0
$ 七年級女生  <int> 0
$ 延修生男生  <int> 0
$ 延修生女生  <int> 0
請將這些欄位水平相加，並將結果存入一個新欄位"總計"中。
```


### 106學年度

> ```令{{year}}=106， 下載並引入這兩個資料集分別取名native106及allStudent106。```

```r
glimpse(slice(allStudent106,2))
glimpse(slice(native106,2))
```

#### 欄位class錯誤


```
allStudent106有以下連續欄位：
$ 一年級男生  <chr> "685"
$ 一年級女生  <chr> "760"
$ 二年級男生  <chr> "571"
$ 二年級女生  <chr> "699"
$ 三年級男生  <chr> "369"
$ 三年級女生  <chr> "456"
$ ：
$ 六年級女生  <chr> "-"
$ 七年級男生  <chr> "-"
$ 七年級女生  <chr> "-"
$ 延修生男生  <chr> "-"
$ 延修生女生  <chr> "-"
請將$ 一年級男生 到 $ 延修生女生，這些欄位都轉換為numeric class。
```


## 函數化

### 新增總計欄位，將每個年級男女生數量相加 ----

```r
library(dplyr)

allStudent104 <- allStudent104 %>%
  mutate(總計 = rowSums(select(., contains("男生"), contains("女生"))))

# 看一下處理後的前3行數據
glimpse(head(allStudent104))
```


### 轉換欄位為數值型態 ----

```r
library(dplyr)

# 將指定範圍的欄位轉換為numeric class
allStudent106 <- allStudent106 %>%
  mutate(across(一年級男生:延修生女生, ~if_else(. == "-", NA_real_, as.numeric(.))))

# 看一下轉換後的前3行數據
glimpse(head(allStudent106))
```