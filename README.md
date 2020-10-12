# intro-testing-r

<!-- badges: start -->
![test](https://github.com/SchlossLab/intro-testing-r/workflows/test/badge.svg)
<!-- badges: end -->

R packages used in this tutorial:

- `testthat`
- `here`
- `tidyverse`

Install them all with: `install.packages(c('testthat', 'here', 'tidyverse'))`.

## Why write unit tests

Writing unit tests is a way to make sure code behaves the way you expect it to.
Even if you have never written a unit test before, chances are good that you 
actually already do write tests when you write code.
You may write a function, then try running it from the console with a few
example inputs to make sure you get the output you expect.
If it works the way you expect, you might decide to call it a day and move on to 
working on other parts of your code.
However, the next step in programming mastery is to take those tests that you 
wrote in the console and put them in a test script to save for later.
Then, you can easily re-run your tests whenever you make changes to your code
to make sure everything still works as expected.
You're more likely to identify bugs in your code and identify them earlier if
you write formal unit tests.

## When to write unit tests

- Ideally, write them as you are writing a new function, or even before you write the function. In a test-driven development workflow, you write your unit tests, _then_ work on the function until all the tests pass.
- Every time you come across a new bug, write a unit test that catches it. Then as you're trying to fix the bug, you'll know that you've fixed it once the test passes.
- You generally don't need to write tests for very simple functions.

## How to test

[`testthat`](https://testthat.r-lib.org/) is the most popular package for unit 
testing in R, so we'll use it throughout this tutorial.

### Packages

If your code is organized as a [package](https://r-pkgs.org/), you can use 
`usethis::use_testthat()` to setup your testing directory & files. 
Create new R scripts in `R/` with `usethis::use_r()` 
and their corresponding test files with `usethis::use_test()`.
Then, test individual files interactively with `testthat::test_file()`,
or test the whole package with `devtools::test()`.

### Non-packages

However, if your project is not a package, you won't be able to use those functions.
`usethis`, `devtools`, and `testthat` were designed strictly with R packages 
in mind, so we have to do a little hacking to make them work for our R projects.
Create a file `tests/testthat.R` and include the following code:

``` r
library(testthat)
test_dir(here::here('tests/testthat/'))
```

Then, write your R code in `code/` (or whatever you want to call it, e.g. `R/`) 
and tests in `tests/testthat/`.
Every R source file in `code/` should have a corresponding file in `tests/testthat/`.
Each test file must source its corresponding R file.
e.g. for code in `code/functions.R`, 
write its tests in `tests/testthat/test-functions.R`.
At the top of `tests/testthat/test-functions.R`, source the R file with 
`source(here::here('code/functions.R'))` 
so the tests will be able to access those functions.

Finally, you can run individual test files interactively, 
or run all of your tests by executing `tests/testthat.R`.

## Automation

The GitHub Actions workflow in `.github/workflows/test.yml` executes 
`tests/testthat.R` to run all tests in `tests/testthat/` whenever there is a 
push or pull request to the master branch on GitHub.
The test badge ![test](https://github.com/SchlossLab/intro-testing-r/workflows/test/badge.svg)
reports the status of this workflow.
GitHub will email you if any of your workflows fail,
so you'll know if you accidentally break your code.
(Alternatively, you can turn those notifications off if ignorance is bliss.)
You can copy this workflow to your own repo if you'd like to use GitHub Actions.

If you're developing an R package, you might like to use the `covr` package
to report code coverage and `devtools` to check other aspects of your package.
See examples of package-specific workflows [here](https://github.com/SchlossLab/mikropml/tree/master/.github/workflows).

## Resources

- [R Packages chapter on testing.](https://r-pkgs.org/tests.html)
- [Discussion on using testthat outside the context of a package.](https://github.com/r-lib/testthat/issues/659)
