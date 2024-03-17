
# 合併資料

## 垂直堆疊合併

### 範例

[大專校院原住民學生及畢業生人數—按等級別與校別分](https://data.gov.tw/dataset/33514)

#### 不同學年度的資料

##### Key concept: (AI) 給予參考範例文字有助回答準確性

工作內容有規律性時，可以適當給予範例文字

AI>
```
這裡有104學年到112學年的CSV下載按鈕，每個按鈕都有對應一個下載網址，例如104學年CSV鈕的代表網址是"https://stats.moe.gov.tw/files/ebook/native/104/104native_A1-1.csv"，請把所有學年的csv鈕的代表網址寫成R list
```

#### 下載並引入

AI>
```
如何將csv_urls的每個網址檔案都下載回來工作目錄，並一一引入存在一個list名為data_list
```

#### 合併

AI>
```
將data_list裡的每個dataframe垂直合併
```

#### 增加學年度欄位再合併

AI>
```
將data_list裡的每個dataframe元素增加"學年度"欄位，它為integer class，代表dataframe元素名稱中的數字, 如元素名稱為"104學年"它的"學年度"欄位值均為104
```

## 練習

[大專院校校別學生數](https://data.gov.tw/dataset/6231)