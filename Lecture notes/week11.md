# 函數

由於程式多是一條直線式的執行（也叫single thread）到底，在每一段直線我們可以看到input（待解決任務的訊息）和output （任務解決後的產出）的影子，例如： 

https://github.com/tpemartin/112-2-R-EE/blob/476752febabf2d5125035169c7ad71dd8781eb04/Lecture%20notes/week10.md?plain=1#L75-L134

## 作法

[![](../img/2024-04-28-06-22-46.png)](https://www.figma.com/file/JF501BeiuwS0C1Hz0tfCyh/teaching-R?type=whiteboard&node-id=26-155&t=qoKsCm8otfQtDuNQ-4)

## 模組化

模組化是指將程式碼分成一個個小模組，每個模組負責一個特定的功能。這樣的好處是可以讓程式碼更容易維護，也可以讓程式碼更容易重複使用。

一個模組檔是一個R script檔，裡面包含了一個或多個函數, 通常這些函數有相關性，例如：一個統計分析模組檔裡面可能包含了一個函數用來計算平均值，另一個函數用來計算標準差。

  - 將`merge_allStudent_native`函數放入`merge.R`檔案裡。  
  - 若要使用`merge_allStudent_native`函數，只需要在R script檔案裡面加入`source("merge.R的路徑")`，就可以使用`merge_allStudent_native`函數。

## 水平合併多學年


- [大專校院原住民學生及畢業生人數—按等級別與校別分](https://data.gov.tw/dataset/33514)  
- [大專院校校別學生數](https://data.gov.tw/dataset/6231)

[AI>>](./week11-prompt.md#水平合併多學年)