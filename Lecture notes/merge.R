merge_allStudent_native112 <- function(allStudent112, native112){
  
  # allStudent112 = allStudent
  # native112 = native
  library(dplyr)
  
  # 水平合併-----
  
  ## 長式化----
  native112_long <- native112 %>%
    pivot_longer(cols = starts_with("在學學生人數"), 
                 names_to = "學制", 
                 values_to = "在學學生人數") %>%
    mutate(學制 = str_extract(學制, "(?<=_).+"))  # 提取學制名稱
  
  native112_long <- native112_long |>
    select(學年度,學校名稱, 學制, 在學學生人數)
  
  # 瀏覽前3行
  glimpse(head(native112_long, 3))
  
  # allStudent112 <- fix_allStudent_class(allStudent112)
  
  ## 短化----
  # 將資料精簡並加總相同學校名稱、等級別的數值型欄位
  allStudent112_short <- allStudent112 %>%
    group_by(學校名稱, 等級別) %>%
    summarise(across(where(is.numeric), sum))
  
  # 瀏覽前3行
  glimpse(head(allStudent112_short, 3))
  
  # 合併 -----
  library(dplyr)
  library(stringr)
  
  # Remove "班" from the "學制" column in native112_long
  native112_long <- native112_long %>%
    mutate(學制 = str_remove(學制, "班"))
  
  # Remove leading whitespace and everything before it from the "等級別" column in allStudent112_short
  allStudent112_short <- allStudent112_short %>%
    mutate(等級別 = str_trim(str_extract(等級別, "(?<=\\s).*")))
  
  # Merge allStudent112_short into native112_long based on school name and 學制/等級別
  allStudent112_short$學年度 <- NULL
  merged_data <- native112_long %>%
    left_join(allStudent112_short, by = c("學校名稱" = "學校名稱", "學制" = "等級別"))
  
  # Display the first 3 rows and structure of the resulting merged data frame
  glimpse(head(merged_data, 3))
  
  # 更改 '在學學生人數' 欄位名為 "原住民生人數"
  merged_data <- merged_data |>
    rename("原住民生人數"='在學學生人數')

  return(merged_data)
}

compute_studentSum <- function(allStudent104){
  # 將各年級男生和女生數量水平相加，並存入新欄位"總計"
  allStudent104 <- allStudent104 %>%
    mutate(總計 = rowSums(select(., contains("男生"), contains("女生")), na.rm=T))
  return(allStudent104)  
}

fix_class <- function(allStudent106){
  # 將數值欄位轉換為 numeric class
  allStudent106 <- allStudent106 %>%
    mutate(across(一年級男生:延修生女生, ~ as.numeric(.)))
  
  return(allStudent106)
}