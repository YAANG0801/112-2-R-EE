

## 水平合併多學年

```
有以下兩個連結：
"https://stats.moe.gov.tw/files/ebook/native/{{year}}/{{year}}native_A1-1.csv"
"https://stats.moe.gov.tw/files/detail/{{year}}/{{year}}_student.csv"
其中{{year}}從104到112， 每個{{year}}需要自這兩個連結分別下載檔案回來並引入到R，其中第一個連結在引入後需要新增一個欄位叫"學年度"它的值等於{{year}}，令引入的兩個資料框分別叫native和allStudent, 這兩個資料框要一起丟入函數merge_allStudent_native112(allStudent112=allStudent, native112=native)去處理得到的output請收錄在一個merged_data的list裡。
```