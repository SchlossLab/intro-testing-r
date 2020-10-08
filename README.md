# intro-testing-r

<!-- badges: start -->
![test](https://github.com/SchlossLab/intro-testing-r/workflows/test/badge.svg)
<!-- badges: end -->

R packages used in this tutorial:

- `testthat`
- `here`
- `tidyverse`

Install them all with: `install.packages(c('testthat', 'here', 'tidyverse'))`.

## Packages vs. Projects

If your code is organized as a package, you can use `usethis::use_testthat()`
to setup your testing directory & files. 
Create new R scripts in `R/` with `usethis::use_r()` 
and their corresponding test files with `usethis::use_test()`.
Then, test individual files interactively with `testthat::test_file()`,
or test the whole package with `devtools::test()`.

### non-packages

However, if your project is not a package, you won't be able to use those functions.
`usethis`, `devtools`, and `testthat` were designed strictly with R packages 
in mind, so we have to do a little hacking to make them work for our R projects.
Create a file `tests/testthat.R` and include the following code:

``` r
library(testthat)
test_dir(here::here('tests/testthat/'))
```

Then, write your R code in `code/` (or whatever you want to call it, e.g. `R/`) and tests in `tests/testthat/`.
Every R source file in `code/` should have a corresponding file in `tests/testthat/`.
Each test file must source its corresponding R file.
e.g. for code in `code/functions.R`, write its tests in `tests/testthat/test-functions.R`.
At the top of `tests/testthat/test-functions.R`, source the R file with `source(here::here('code/functions.R'))` so the tests will be able to access those functions.

Finally, you can run individual test files, or run all of your tests by sourcing `tests/testthat.R`.

## Automation

The GitHub Actions workflow in `.github/workflows/test.yml` executes 
`tests/testthat.R` to run all tests in `tests/testthat/` whenever there is a 
push or pull request to the master branch on GitHub.
The test badge ![test](https://github.com/SchlossLab/intro-testing-r/workflows/test/badge.svg)
reports the status of this workflow.
GitHub will email you if any of your workflows fail,
so you'll know if you accidentally break your code.
(Alternatively, you can turn those notifications off if ignorance is bliss.)

## Resources

- [R Packages chapter on testing.](https://r-pkgs.org/tests.html)
- [Discussion on using testthat outside the context of a package.](https://github.com/r-lib/testthat/issues/659)
