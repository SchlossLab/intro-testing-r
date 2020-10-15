source(here::here('code/example.R'))
test_that("paste_oxford_list() works for vectors & lists", {
    expect_equal(paste_oxford_list(1:3), "1, 2, and 3")
    expect_equal(paste_oxford_list(as.list(1:3)), "1, 2, and 3")
    expect_equal(paste_oxford_list(1:2), "1 and 2")
    expect_equal(paste_oxford_list(1), "1")
})
test_that("paste_oxford_list() errors on unsupported data types", {
    error_msg <- '`x` must be a list or vector, but you provided'
    expect_error(paste_oxford_list(NULL), error_msg)
    expect_error(paste_oxford_list(data.frame(a = 1:3,
                                              b = 4:6,
                                              c = c('cat', 'dog', 'turtle'))),
                 error_msg)
})
