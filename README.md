
# intro-testing-r

<!-- badges: start -->
<!-- badges: end -->

## Structure

Write code in `code/` and tests in `tests/testthat/`.
Every R script in `code/` should have a corresponding file in `tests/testthat/`.
e.g. For code in `code/functions.R`, write its tests in `tests/testthat/test-functions.R`.

## Automation

The workflow in `.github/workflows/test.yml` executes `tests/testthat.R` to run
all tests in `tests/testthat/` whenever there is a push or pull request to
the master branch on GitHub.
The test badge reports the status of this workflow, 
so you'll know if you accidentally break your code.

## Resources

- 
- Discussion on using testthat outside the context of a package: https://github.com/r-lib/testthat/issues/659

