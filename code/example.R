#' Create a prose string from a list or vector
#'
#' The word 'and' is inserted before the last element and an Oxford comma is used.
#'
#' @param x a list or vector
#'
#' @return a string where each element in `x` is separated by a comma
#' @examples
#' paste_oxford_list(1:3)
#' paste_oxford_list(c("cats", "dogs", "turtles"))
paste_oxford_list <- function(x) {

    # is.vector() is weird https://stackoverflow.com/questions/26610129/when-does-is-vector-return-true
    # but it actually works for this purpose.

    supported_types <- c('list', 'logical', 'numeric', 'integer', 'character', "complex")

    #if (!(class(x) %in% supported_types)) {
    #if (!is.vector(x) & !is.list(x)) {
    if (!is.vector(x)) {
        stop('`x` must be a list or vector, but you provided: \n    ', class(x))
    }


    length_x <- length(x)
    if (length_x == 0) {
        prose <- ''
    } else if (length_x < 2) {
        prose <- as.character(x)
    } else if (length_x == 2) {
        prose <- paste(x, collapse = " and ")
    } else {
        first_elements <- paste0(x[1:length_x - 1], collapse = ", ")
        prose <- paste0(first_elements, ", and ", x[[length_x]])
    }
    return(prose)
}
