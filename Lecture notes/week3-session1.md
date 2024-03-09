# Week 3 Session 1


- [<span class="toc-section-number">1</span> Goals](#goals)
  - [<span class="toc-section-number">1.1</span> Key concept: Harpa
    ChatGPT and API](#key-concept-harpa-chatgpt-and-api)
  - [<span class="toc-section-number">1.2</span> key concept: Preset
    your AI chat](#key-concept-preset-your-ai-chat)
  - [<span class="toc-section-number">1.3</span>
    如何引入外部資料到R](#如何引入外部資料到r)
    - [<span class="toc-section-number">1.3.1</span>
      開放政府資料](#開放政府資料)
    - [<span class="toc-section-number">1.3.2</span>
      常見資料格式](#常見資料格式)
    - [<span class="toc-section-number">1.3.3</span>
      使用AI介紹](#使用ai介紹)
    - [<span class="toc-section-number">1.3.4</span> Key concept: (AI)
      透過page模式和網頁聊天](#key-concept-ai-透過page模式和網頁聊天)
    - [<span class="toc-section-number">1.3.5</span> (AI)
      介紹這裡的檔案格式](#ai-介紹這裡的檔案格式)
  - [<span class="toc-section-number">1.4</span> 活動](#活動)
    - [<span class="toc-section-number">1.4.1</span> Key concept:
      (AI)善用AI
      chat的記憶性設定前提](#key-concept-ai善用ai-chat的記憶性設定前提)

# Goals

## Key concept: Harpa ChatGPT and API

ChatGPT是免費的但只能用gpt-3.5 model

API是使用者付費，可自由設定所使用的openAI models

## key concept: Preset your AI chat

> For the following chat, if the answer is programming related, use R
> only.

## 如何引入外部資料到R

### 開放政府資料

<https://data.gov.tw/>

### 常見資料格式

![](../img/2024-03-09-06-36-20.png)

### 使用AI介紹

AI \>

``` ai
介紹這裡所有的檔案格式
```

### Key concept: (AI) 透過page模式和網頁聊天

點選下角的page模式，可以把網頁換成一個具有該頁面知識的AI直接和它聊網頁內容。

> page模式會耗較多資源，不需要針對page時記得關掉page模式。

![](../img/2024-03-09-06-40-50.png)

### (AI) 介紹這裡的檔案格式

    根據提供的資訊，這裡的資料集包含多種檔案格式。以下是這些檔案格式的介紹：

    1. **CSV (逗號分隔值)**:
       - CSV格式是最常見的檔案格式之一。
       - CSV檔案以純文字形式儲存表格數據，並使用逗號分隔不同的值。
       - 這裡的資料集中包含了許多CSV格式的檔案，用於儲存各種數據，如YouBike區域互補站點、高雄市原住民部落大學教育參與人次等。

    2. **JSON (JavaScript Object Notation)**:
       - JSON格式也是一種常見的資料交換格式。
       - JSON檔案使用JavaScript對象表示法來儲存資料，具有易於閱讀和撰寫的特點。
       - 資料集中的一些檔案使用JSON格式，例如大專校院原住民學生及畢業生人數按年級別、等級別與性別分等。

    3. **XML (eXtensible Markup Language)**:
       - XML是一種標記語言，常用於儲存和傳輸結構化的數據。
       - 在這裡的資料集中，也有部分檔案使用XML格式。

    4. **ODS (OpenDocument Spreadsheet)**:
       - ODS是OpenDocument格式的一部分，用於儲存試算表數據。
       - 這裡的資料集中也包含了一些ODS格式的檔案。

    5. **其他格式**:
       - 此外，還有一些其他格式的檔案，如API、XLSX、PDF、WEBSERVICES、ZIP、ODT、DOCX、XLS、JPG等。

    這些不同的檔案格式提供了靈活性，使得資料可以在不同的應用程序中進行共享和使用。用户可以根據自己的需求和偏好，選擇最合適的檔案格式進行數據處理和分析。

## 活動

在開放政府找一個資料，並請AI教你如何把資料引入R.

### Key concept: (AI)善用AI chat的記憶性設定前提

AI\>

    以下問題如果回覆用到程式請使用R
