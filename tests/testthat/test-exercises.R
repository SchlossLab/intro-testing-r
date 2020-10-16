source(here::here('code/exercises.R'))
XXXX <- "replace every `XXXX` with real code in the tests below"

test_that('do_something() works', {
    # write a test where you give do_something() a character
    expect_equal(do_something('abc'), data.frame(a = 'abc'))
    # write a test where you give do_something() a vector of characters
    expect_equal(do_something(c('d', 'e', 'f')), data.frame(a = c('d', 'e', 'f')))
    # write a test where you give do_something() a numeric
    expect_equal(do_something(1), data.frame(a = 1))
})

test_that('main() works', {
    # write a test for when `do_calc = FALSE`
    expect_equal(main(do_calc = FALSE), list(calc = "skipped `calc_something_big()`"))
    # write a test for when `do_calc = TRUE`
    expect_equal(main(do_calc = TRUE), list(calc = data.frame(a = 1:3, b = 4:6)))
})

test_that('to_rel_abun() works', {
    # write a test to check expected relative abundances
    expect_equal(to_rel_abun(data.frame(otu1 = 1:3,
                                        otu2 = 0:2)),
                 tibble(otu1 = c(1, 0.6667, 0.6),
                        otu2 = c(0, 0.3333, 0.4)),
                 tolerance = 0.0001
    )
    # write a test to make sure to_rel_abun() throws an error for negative abundance values
    expect_error(to_rel_abun(data.frame(otuA = -1:10,
                                        otuB = -5:6)),
                 "Dataset contains abundance less than zero")
})

test_that('check_missing() errors on NAs', {
    # write tests for when you expect check_missing() to do nothing
    expect_null(check_missing(1))
    expect_null(check_missing('abc'))
    # write a test for when you expect check_missing() to throw an error
    error_msg <- '`x` cannot contain `NA`'
    expect_error(check_missing(NA), error_msg)
    # write a test for a vector with no `NA`s
    expect_null(check_missing(1:10))
    # write a test for a vector containing an `NA`
    expect_error(check_missing(c('a', NA, 'c')), error_msg)
})

test_that('is_frac() works and errors on non-numerics', {
    # write tests for when you expect is_frac() to return true
    #  Test both edge cases (the ends of the range of numbers is_frac() should accept)
    #  plus values in the middle of the range.
    expect_true(is_frac(0))
    expect_true(is_frac(1))
    expect_true(is_frac(0.5))
    # write tests for when you expect is_frac() to return false
    #  with numbers that are too small and numbers that are too large.
    expect_false(is_frac(-1))
    expect_false(is_frac(1.1))
    # write tests for when you expect is_frac() to throw an error
    error_msg <- "`frac` must be numeric"
    expect_error(is_frac('abc'), error_msg)
    expect_error(is_frac(data.frame(a=1:3)), error_msg)
    # write tests using vectors of fractions,
    #  then modify is_frac() until it works.
    #  Don't forget to test both "good" and "bad" vectors.
    expect_true(is_frac(c(0, 0.1, 0.9, 1)))
    expect_false(is_frac(-1:2))
    expect_error(is_frac(c('abc', 'def')), error_msg)
})

test_that('check_binary_outcome() fails on non-binary outcomes', {
    # write tests for when you expect check_binary_outcome() to throw an error.
    #  be sure to include multiple cases with too few and too many outcomes.
    error_msg <- "A binary outcome variable is required, but this dataset has"
    expect_error(check_binary_outcome(
        data.frame(dx = c('cancer', 'normal', 'adenoma'),
                   a = 1:3,
                   b = 4:6), 'dx'),
        paste(error_msg, 3))
    expect_error(check_binary_outcome(
        tibble::tibble(dx = 1:10,
                       a = 1:10), 'dx'),
        paste(error_msg, 10))
    expect_error(check_binary_outcome(
        tibble::tibble(dx = c('an outcome'),
                       a = c('a')), 'dx'),
        paste(error_msg, 1))
    expect_error(check_binary_outcome(
        data.frame(dx = c()), 'dx'))

    # write tests for when you expect check_binary_outcome() to return nothing
    expect_null(check_binary_outcome(
        data.frame(dx = c('cancer', 'normal', 'normal')), 'dx'))
    expect_null(check_binary_outcome(
        tibble::tibble(dx = c('normal', 'cancer', 'normal')), 'dx'))
})

# BONUS exercises
#   see the README: https://github.com/SchlossLab/intro-testing-r#bonus
