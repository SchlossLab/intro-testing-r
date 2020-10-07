source(here::here('code/functions.R'))
test_that("paste_oxford_list() works for vectors & lists", {
    expect_equal(paste_oxford_list(1:3), "1, 2, and 3")
    expect_equal(paste_oxford_list(as.list(1:3)), "1, 2, and 3")
    expect_equal(paste_oxford_list(1:2), "1 and 2")
    expect_equal(paste_oxford_list(1), "1")
})
test_that('get_outcome_type() works', {
    # todo: data.frame vs tibble with $ vs dplyr::pull
    expect_true(check_binary_outcome(data.frame(
        dx = c('cancer', 'normal', 'normal')
    ), 'dx'))
    expect_true(check_binary_outcome(tibble::tibble(
        dx = c('cancer', 'normal', 'normal')
    ), 'dx'))
})
test_that('get_outcome_type() fails', {
    expect_error(check_binary_outcome(data.frame(
        dx = c('cancer', 'normal', 'adenoma'),
        a = 1:3,
        b = 4:6
    ), 'dx'), "A binary outcome variable is required")
    expect_error(check_binary_outcome(tibble::tibble(
        dx = 1:10,
        a = 1:10
    ), 'dx'), "A binary outcome variable is required")
})
