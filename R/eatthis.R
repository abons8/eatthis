#' eatthis
#'
#' @param dat a dataframe of food items and categories
#' @param cat a category
#' @param seed a random seed
#'
#' @return Returns a randomly selected foot item
#' @export
#'
#' @examples
#' eatthis(dat = eatthis_data)
#' eatthis(dat = eatthis_data, cat = "Lunch or Dinner")

eatthis <- function(dat, cat = NULL, seed = 1) {

  set.seed(seed)

  if (is.null(cat)) {
    print(paste0("Warning: You did not select a category of food. Be prepared to eat anything!..."))
    dat1 <- dat
  }

  if (!is.null(cat)) {
    print(paste0("Choosing a food item from the ", cat, " category."))
    dat1 <-
      dat %>%
      dplyr::filter(Category == cat)
  }

  items <- dat1 %>% dplyr::pull(Item)
  n_items <- nrow(dat1)
  item <- sample(x = items, size = 1, replace = T)
  return(item)
}
