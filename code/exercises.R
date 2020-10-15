library(tidyverse)

some_var <- 'abc'
#' Imagine this does something useful
#'
#' @param some_Var
#' @return a dataframe with results
do_something <- function(some_Var) {
    # functions have access to global variables.
    # if you use similar variable names, you may make fatal typos.
    # some_[V|v]ar probably should have a different and more informative name entirely.

    #return(data.frame(a = some_var))
    return(data.frame(a = some_Var))
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

    if (isTRUE(do_calc)) {
        calc_result <- calc_something_big()
    } else {
        calc_result <- 'skipped `calc_something_big()`'
    }

    # `ifelse()` is not a drop-in replacement for a block of `if () {} else {}`

    #calc_result <- ifelse(isTRUE(do_calc), calc_something(), 'skipped `calc_something()`')

    return(list(calc = calc_result))
}

#' Throw an error if `x` contains `NA`.
#'
#' Returns nothing if `x` is good.
#'
#' @param x object to check
check_missing <- function(x) {
    # make the check work on vectors & lists (not just scalars) with `%in%`

    #if (is.na(x)) {
    if (NA %in% x) {
        stop('`x` cannot contain `NA`')
    }
}

#' Check whether the number is a fraction.
#'
#' @param frac fraction (numeric)
#' @return TRUE if `frac` is in [0, 1], else `FALSE`
is_frac <- function(frac) {

    # comparing characters to numbers doesn't throw an error,
    # so we have to check if `frac` is numeric ourselves.
    if (!is.numeric(frac)) {
        stop("`frac` must be numeric.\n",
             "    You provided: ", class(frac))
    }

    # the original code used | (or) instead of & (and),
    #  so it returned `TRUE` regardless of the input.
    # it also used the wrong comparison operators, so it excluded 0 and 1.
    #
    # to make this work on a vector, use `all()`

    #return(frac > 0 | frac < 1)
    return(all(frac >= 0 & frac <= 1))
}

#' Sample a random fraction of a vector
#'
#' @param x vector to sample from
#' @param frac size of the sample as a fraction
#' @return a simple random sample of size `frac`
sample_frac <- function(x, frac) {

    # need to make sure the fraction has a length of 1.
    # sample() will just pick the first value if you give it a vector.

    #if (!is_frac(frac)) {
    if (!is_frac(frac) | length(frac) != 1) {
        stop("`frac` must be numeric between 0 and 1 (inclusive).\n",
             "    You provided: ", paste(frac, collapse = ', '))
    }

    num_items <- frac * length(x)
    return(sample(x, num_items))
}


#' Check that the outcome column is binary
#'
#' @param dataset dataframe with a column containing outcomes
#' @param outcome_colname name of the column containing outcomes
check_binary_outcome <- function(dataset, outcome_colname) {

    # subsetting a single column from a dataframe with square brackets returns a vector
    # but subsetting a tibble with square brackets always returns a tibble.
    # use `dplyr::pull()` if you need a vector from a tibble.

    #outcomes <- dataset[, outcome_colname] %>% unique()
    outcomes <- dataset %>% pull(outcome_colname) %>% unique()

    num_outcomes <- length(outcomes)
    if (num_outcomes != 2) {
        stop("A binary outcome variable is required, but this dataset has ",
             num_outcomes,  " outcome(s): ", paste(outcomes, collapse = ", "))
    }
}
