# 發送HTTP POST請求以獲取資料 -----

# 讀取需要的套件
library(httr)
library(jsonlite)

# 設置請求的URL
url <- "https://tw.fd-api.com/rlp-service/query"

# 設置請求的headers
headers <- add_headers(
  accept = "application/json, text/plain, */*",
  `accept-language` = "en-US,en;q=0.9,zh-TW;q=0.8,zh;q=0.7",
  `app-version` = "MICROFRONT.24.22.23",
  authorization = "",
  `content-type` = "application/json;charset=UTF-8",
  `dps-session-id` = "eyJzZXNzaW9uX2lkIjoiNzNkZGNlMTg0ZWYxYmUyZTM0YTAyOGVkZDUyNzcwMmEiLCJwZXJzZXVzX2lkIjoiMTcxNjg2NDcyNTc2Ny45MjYzMzYwNzM0Mjc2NzE3NDEud2phZXoyODliMSIsInRpbWVzdGFtcCI6MTcxNzEzOTU4OX0=",
  `perseus-client-id` = "1716864725767.926336073427671741.wjaez289b1, 1716864725767.926336073427671741.wjaez289b1",
  `perseus-session-id` = "1717139589039.914655024447223002.pfdu509pv4, 1717139589039.914655024447223002.pfdu509pv4",
  platform = "web",
  priority = "u=1, i",
  `request-id` = "fb990496-107c-4a1a-95b0-72cb052abef9",
  `sec-ch-ua` = "\"Google Chrome\";v=\"125\", \"Chromium\";v=\"125\", \"Not.A/Brand\";v=\"24\"",
  `sec-ch-ua-mobile` = "?0",
  `sec-ch-ua-platform` = "\"macOS\"",
  `sec-fetch-dest` = "empty",
  `sec-fetch-mode` = "cors",
  `sec-fetch-site` = "cross-site",
  `x-fp-api-key` = "volo",
  Referer = "https://www.foodpanda.com.tw/",
  `Referrer-Policy` = "strict-origin-when-cross-origin"
)

# 設置請求的body
body <- '{
    "query": "query getOrganicListing(...)",
    "variables": {
        "input": {
            "latitude": 24.94749,
            "longitude": 121.37446,
            "locale": "zh_TW",
            "language_id": "6",
            "customer_id": "",
            "customer_type": "REGULAR",
            "expedition_type": "DELIVERY",
            "joker_offers": {
                "single_discount": true
            },
            "feature_flags": [
                {
                    "name": "dynamic-pricing-indicator",
                    "value": "Original"
                }
            ],
            "subscription": {
                "status": "NON_ELIGIBLE",
                "has_benefits": false
            },
            "organic_listing": {
                "views": [
                    {
                        "budgets": "",
                        "configuration": "Original",
                        "cuisines": "",
                        "discounts": "",
                        "food_characteristics": "",
                        "quick_filters": "",
                        "use_free_delivery_label": true,
                        "ncr_place": "list",
                        "ncr_screen": "shop_list",
                        "payment_types": "",
                        "delivery_providers": "",
                        "discount_labels": "",
                        "tag_label_metadata": true,
                        "limit": 48,
                        "offset": 0
                    }
                ]
            },
            "swimlanes": {
                "config": "Original"
            }
        },
        "includeCarousels": true,
        "includeSwimlanes": true,
        "includeJoker": false,
        "includeDynamicSearchbarConfig": false
    }
}'

# 發送POST請求
response <- POST(url, headers, body = body)

# 解析並顯示響應
response_content <- content(response, "parsed", simplifyVector = TRUE)
response_content %>% glimpse()
