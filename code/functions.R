#' Create a prose string from a list or vector
#'
#' The word 'and' is inserted before the last element and an Oxford comma is used.
#'
#' @param x a list or vector
#'
#' @return a string where each element in `x` is separated by a comma
#' @export
#' @examples
#' paste_oxford_list(1:3)
#' paste_oxford_list(c("cats", "dogs", "turtles"))
paste_oxford_list <- function(x) {
    if (length(x) < 2) {
        prose <- as.character(x)
    } else if (length(x) == 2) {
        prose <- paste(x, collapse = " and ")
    } else {
        length_x <- length(x)
        first_elements <- paste0(x[1:length_x - 1], collapse = ", ")
        prose <- paste0(first_elements, ", and ", x[[length_x]])
    }
    return(prose)
}

#' Check that the outcome column is binary
#'
#' @param dataset dataframe with a column containing outcomes
#' @param outcome_colname name of the column containing outcomes
#' @return `TRUE` if outcome is binary; fails otherwise
check_binary_outcome <- function(dataset, outcome_colname) {
    outcomes <- dataset %>%
        dplyr::pull(outcome_colname) %>%
        unique()
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
    calc_result <- ifelse(isTRUE(do_calc),
                         calc_something(),
                         'skipped `calc_something()`')
    return(list(calc = calc_result))
}
