library(tidyverse)


some_var <- 'abc'
#' Imagine this calculates something useful
#'
#' @param some_Var
#' @return a dataframe with results
calc_some_var <- function(some_Var) {
    # functions have access to global variables.
    # if you use similar variable names, you may make fatal typos.
    return(data.frame(a = some_var))
}

#' Throw an error if `x` is `NA`
#'
#' @param x object to check
check_missing_value <- function(x) {
    #if (is.na(x)) {
    if (NA %in% x) {
        stop('`x` cannot contain `NA` values')
    }
}

#' Check that the fraction is greater than 0 and less than 1
#'
#' @param frac fraction (numeric)
check_frac <- function(frac) {
    if (!is.numeric(frac) | (frac <= 0) | (frac >= 1)) {
        stop(paste0(
            "`frac` must be a numeric between 0 and 1.\n",
            "    You provided: ", frac
        ))
    }
}

#' Sample a random fraction of a vector
#'
#' @param x vector to sample from
#' @param frac size of the sample as a fraction
#' @return a simple random sample of size `frac`
sample_frac <- function(x, frac) {
    check_frac(frac)
    num_items <- frac * length(x)
    return(sample(x, num_items))
}

#' Check that the outcome column is binary
#'
#' @param dataset dataframe with a column containing outcomes
#' @param outcome_colname name of the column containing outcomes
#' @return `TRUE` if outcome is binary; fails otherwise
check_binary_outcome <- function(dataset, outcome_colname) {

    outcomes <- dataset %>% pull(outcome_colname) %>% unique()
    # subsetting a single column from a dataframe with square brackets returns a vector
    # but subsetting a tibble with square brackets always returns a tibble.
    # use `dplyr::pull()` if you need a vector from a tibble.
    #outcomes <- dataset[, outcome_colname] %>% unique()

    num_outcomes <- length(outcomes)
    if (num_outcomes != 2) {
        stop(
            paste0(
                "A binary outcome variable is required, but this dataset has ",
                num_outcomes,  " outcome(s): ", paste(outcomes, collapse = ", ")
            )
        )
    }
    return(TRUE)
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
#' @export
#'
#' @examples
main <- function(do_calc = FALSE) {

    if (isTRUE(do_calc)) {
        calc_result <- calc_something_big()
    } else {
        calc_result <- 'skipped `calc_something_big()`'
    }

    # `ifelse()` is not a drop-in replacement for a block of `if () {} else {}`
    #calc_result <- ifelse(isTRUE(do_calc), calc_something(), 'skipped `calc_something()`')

    return(list(calc = calc_result))
}

