## code to prepare `eatthis_data` dataset goes here

dat1 <- xlsx::read.xlsx(file = here::here("data-raw", "eatthis_data.xlsx"), sheetIndex = 1, stringsAsFactors = F)
dat2 <-
  dat1 %>%
  dplyr::select(Category, Item)
eatthis_data <- dat2
usethis::use_data(eatthis_data, overwrite = TRUE)
