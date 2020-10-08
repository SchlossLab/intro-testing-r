#' Check that the outcome column is binary
#'
#' @param dataset dataframe with a column containing outcomes
#' @param outcome_colname name of the column containing outcomes
#' @return `TRUE` if outcome is binary; fails otherwise
check_binary_outcome <- function(dataset, outcome_colname) {

    outcomes <- dataset %>% dplyr::pull(outcome_colname) %>% unique()
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
#' @return results as a dataframe
calc_something <- function() {
    data.frame(a = 1:3, b = 4:6)
}

#' Imagine this is the main function of a complicated script
#'
#' @param do_calc whether to run `calc_something()` or not (default: `FALSE`)
#'
#' @return results as a named list
#' @export
#'
#' @examples
main <- function(do_calc = FALSE) {

    if (isTRUE(do_calc)) {
        calc_result <- calc_something()
    } else {
        calc_result <- 'skipped `calc_something()`'
    }

    # `ifelse()` is not a drop-in replacement for a block of `if () {} else {}`
    #calc_result <- ifelse(isTRUE(do_calc), calc_something(), 'skipped `calc_something()`')

    return(list(calc = calc_result))
}
