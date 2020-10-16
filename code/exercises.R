library(tidyverse)

some_var <- 'abc'
#' Imagine this does something useful
#'
#' @param some_Var
#' @return a dataframe with results
do_something <- function(some_Var) {
    return(data.frame(a = some_var))
}

#' Imagine this is a resource-intensive calculation
#'
#' Also imagine that it is always correct and you don't need to test it
#'
#' @return results as a dataframe
calc_something_big <- function() {
    return(data.frame(a = 1:3, b = 4:6))
}

#' Imagine this is the main function of a complicated script
#'
#' @param do_calc whether to run `calc_something_big()` or not (default: `FALSE`)
#'
#' @return results as a named list
#'
#' @examples
main <- function(do_calc = FALSE) {
    calc_result <- ifelse(isTRUE(do_calc), calc_something(), 'skipped `calc_something()`')

    return(list(calc = calc_result))
}

#' Calculate relative abundances
#'
#' @param dat data.frame of absolute OTU abundances with columns as OTUs and rows as samples
#'
#' @return data.frame of relative OTU abundances
#' @examples
#' to_rel_abun(data.frame(otu1 = 1:3, otu2 = 0:2))
to_rel_abun <- function(dat) {
    if (any(dat < 0)) {
        print("Dataset contains abundance less than zero.")
    }
    return(
        dat %>%
            rowwise() %>%
            mutate(abun_sum = sum(c_across())) %>%
            mutate(across(-abun_sum, ~ .x / abun_sum)) %>%
            ungroup()
    )
}

#' Throw an error if `x` contains `NA`.
#'
#' Returns nothing if `x` is good.
#'
#' @param x object to check
check_missing <- function(x) {
    if (is.na(x)) {
        stop('`x` cannot contain `NA`')
    }
}

#' Check whether the number is a fraction.
#'
#' @param frac fraction (numeric)
#' @return TRUE if `frac` is in [0, 1], else `FALSE`
is_frac <- function(frac) {
    return(frac > 0 | frac < 1)
}

#' Check that the outcome column is binary
#'
#' @param dataset dataframe with a column containing outcomes
#' @param outcome_colname name of the column containing outcomes
check_binary_outcome <- function(dataset, outcome_colname) {
    outcomes <- dataset[, outcome_colname] %>% unique()
    num_outcomes <- length(outcomes)
    if (num_outcomes != 2) {
        stop("A binary outcome variable is required, but this dataset has ",
             num_outcomes,  " outcome(s): ", paste(outcomes, collapse = ", "))
    }
}
