source(here::here('code/exercises.R'))
test_that('get_outcome_type() works', {
    expect_true(check_binary_outcome(data.frame(
        dx = c('cancer', 'normal', 'normal')
    ), 'dx'))
    expect_true(check_binary_outcome(tibble::tibble(
        dx = c('cancer', 'normal', 'normal')
    ), 'dx'))
})
test_that('get_outcome_type() fails on non-binary outcomes', {
    expect_error(check_binary_outcome(data.frame(
        dx = c('cancer', 'normal', 'adenoma'),
        a = 1:3,
        b = 4:6
    ), 'dx'), "A binary outcome variable is required")
    expect_error(check_binary_outcome(tibble::tibble(
        dx = 1:10,
        a = 1:10
    ), 'dx'), "A binary outcome variable is required")
    expect_error(check_binary_outcome(tibble::tibble(
        dx = c('an outcome'),
        a = c('a')
    ), 'dx'), "A binary outcome variable is required")
})
test_that('main() works', {
    expect_equal(main(do_calc = FALSE), list(calc = "skipped `calc_something()`"))
    expect_equal(main(do_calc = TRUE), list(calc = data.frame(a = 1:3, b = 4:6)))
})
