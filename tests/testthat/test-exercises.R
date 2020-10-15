source(here::here('code/exercises.R'))
XXXX <- "replace every `XXXX` with real code in the tests below"

test_that('do_something() works', {
    # write a test where you give do_something() a character
    expect_XXXX(do_something('abc'), XXXX)
    # write a test where you give do_something() a vector of characters
    expect_XXXX(XXXX, data.frame(a = c('d', 'e', 'f')))
    # write a test where you give do_something() a numeric
    expect_XXXX(XXXX, XXXX)
})

test_that('main() works', {
    # write a test for when `do_calc = FALSE`
    expect_XXXX(XXXX, list(calc = "skipped `calc_something_big()`"))
    # write a test for when `do_calc = TRUE`
    expect_XXXX(XXXX, list(calc = data.frame(a = 1:3, b = 4:6)))
})

test_that('check_missing() errors on NAs', {
    # write tests for when you expect check_missing() to do nothing
    expect_XXXX(check_missing(1))
    expect_XXXX(check_missing('abc'))
    # write a test for when you expect check_missing() to throw an error
    error_msg <- '`x` cannot contain `NA`'
    expect_XXXX(check_missing(NA), error_msg)
    # write a test for a vector with no `NA`s
    expect_XXXX(check_missing(XXXX))
    # write a test for a vector containing an `NA`
    expect_XXXX(XXXX)
})

test_that('is_frac() works and errors on non-numerics', {
    # write tests for when you expect is_frac() to return true
    #  Test both edge cases (the ends of the range of numbers is_frac() should accept)
    #  plus values in the middle of the range.
    expect_true(is_frac(XXXX))
    expect_true(is_frac(XXXX))
    expect_true(is_frac(XXXX))
    # write tests for when you expect is_frac() to return false
    #  with numbers that are too small and numbers that are too large.
    expect_false(is_frac(XXXX))
    expect_false(is_frac(XXXX))
    # write tests for when you expect is_frac() to throw an error
    error_msg <- "`frac` must be numeric"
    expect_XXXX(is_frac(XXXX), error_msg)
    expect_XXXX(is_frac(XXXX), error_msg)
    # write tests using vectors of fractions,
    #  then modify is_frac() until it works.
    #  Don't forget to test both "good" and "bad" vectors.
    expect_true(is_frac(XXXX))
    expect_false(is_frac(XXXX))
    expect_error(is_frac(XXXX), XXXX)
})

test_that('sample_frac() works', {
    # NOTE: you should fix the bug(s) in is_frac() before this one.
    # HINT: if you write these tests correctly,
    #    only one of them will fail before you fix the bug in sample_frac().

    # write tests for when you expect sample_frac() to throw an error
    error_msg <- "`frac` must be numeric"
    expect_error(sample_frac(1:10, -1), error_msg)
    expect_error(sample_frac(1:10, 'abc'), error_msg)
    expect_error(sample_frac(1:10, NULL), error_msg)
    expect_error(sample_frac(1:10, 1:3 / 10), error_msg)
    # write tests to check the expected length of sample_frac() for various fractions.
    #  be sure to test edge cases and values in the middle.
    # test a large x
    expect_equal(length(sample_frac(1:1000, 1)), 1000)
    expect_equal(length(sample_frac(1:1000, 0.5)), XXXX)
    expect_equal(length(sample_frac(1:1000, 0.001)), XXXX)
    expect_equal(length(sample_frac(1:1000, 0)), XXXX)
    # test a small x
    expect_equal(length(sample_frac(XXXX, 1)), 10)
    expect_equal(length(sample_frac(XXXX, 0.9999999)), XXXX)
    expect_equal(length(sample_frac(XXXX, 0.1)), XXXX)
    expect_equal(length(sample_frac(XXXX, 0.01)), XXXX)
    # test a realllly small x
    expect_equal(length(sample_frac('a', 1)), 1)
    expect_equal(length(sample_frac('a', 0.9)), XXXX)
    # are you sure that x was as small as possible?
    expect_equal(length(sample_frac(XXXX, 0)), 0)
    expect_equal(length(sample_frac(XXXX, 1)), 0)
})

test_that('check_binary_outcome() errors on non-binary outcomes', {
    # write tests for when you expect check_binary_outcome() to throw an error.
    #  be sure to include multiple cases with too few and too many outcomes.
    expect_error(check_binary_outcome(
        data.frame(dx = c()), 'dx'))
    error_msg <- XXXX
    expect_error(check_binary_outcome(
        data.frame(dx = c('cancer', 'normal', 'adenoma'),
                   a = 1:3,
                   b = 4:6), 'dx'),
        paste(error_msg, 3))
    expect_error(check_binary_outcome(
        data.frame(dx = 1:10,
                   a = 1:10), 'dx'),
        paste(error_msg, XXXX))
    expect_error(check_binary_outcome(
        data.frame(dx = XXXX,
                   a = c('a')), 'dx'),
        paste(error_msg, 1))

    # write tests for when you expect check_binary_outcome() to return nothing
    expect_XXXX(check_binary_outcome(
        data.frame(dx = c(XXXX)), 'dx'))
    expect_XXXX(check_binary_outcome(
        tibble::tibble(dx = c(XXXX)), 'dx'))
})

# BONUS exercises
#   see the README: https://github.com/SchlossLab/intro-testing-r#bonus
