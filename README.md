# intro-testing-r

Introduction to Testing R Code

<!-- badges: start -->
| Branch | Status |
|--------|--------|
| default | [![test](https://github.com/SchlossLab/intro-testing-r/workflows/tests/badge.svg)](https://github.com/SchlossLab/intro-testing-r/actions?query=workflow%3Atests) |
| [key](https://github.com/SchlossLab/intro-testing-r/tree/key) | [![test](https://github.com/SchlossLab/intro-testing-r/workflows/tests/badge.svg?branch=key)](https://github.com/SchlossLab/intro-testing-r/actions?query=workflow%3Atests) |

<!-- badges: end -->

## Setup

Clone this repo from the command line with:

``` sh
git clone https://github.com/SchlossLab/intro-testing-r.git
```

Install R packages used in this Code Club from an R console with: 

``` r 
install.packages(c('testthat', 'here', 'tidyverse'))
```

## Why

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

## When

- Ideally, write them as you are writing a new function, or even before you write the function. In a test-driven development workflow, you write your unit tests, _then_ work on the function until all the tests pass.
- Every time you come across a new bug, write a unit test that catches it. Then as you're trying to fix the bug, you'll know that you've fixed it once the test passes.
- You generally don't need to write tests for very simple functions.

## How

[`testthat`](https://testthat.r-lib.org/) is the most popular package for unit 
testing in R, so we'll use it throughout this Code Club.

If you're reading this prior to the Schloss Lab Meeting [Code Club](https://twitter.com/kelly_sovacool/status/1299342698936229889?s=20),
I'll walk through an example of how to write tests with `testthat`
before we break out into pairs to work on the [exercises](#exercises).
Otherwise, I recommend taking a look at the 
[R Packages chapter on testing](https://r-pkgs.org/tests.html)
before proceeding to the [exercises](#exercises).

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
If you source your code at the top of each test file, the tests will always
use your updated code when you run the whole test file.
If you run tests individually, don't forget to source your functions again 
after you modify them before testing.

## Exercises

All of the functions in `code/exercises.R` have one or more bugs to be fixed.
Take a look at `tests/testthat/test-exercises.R` and fill in the blanks to
create unit tests that will help you track down and fix the bugs.
For each `test_that()` call, first write/modify the unit tests, 
then edit the function until the tests pass.

If you get stuck, ask Kelly for a hint or take a peek at the [answer key](https://github.com/SchlossLab/intro-testing-r/tree/key).

### BONUS

1. Set up testthat for one of your existing R projects.
Write a simple unit test to start with to make sure you have it set up correctly.
See instructions [above](#packages).

2. Read the [section on automation](#automate) 
and set up a GitHub Actions workflow for your project.

3. You may have noticed that many of these exercises have to do with **input validation**;
i.e. the function should check that the user gave it input that it knows how to handle,
and should signal a condition with an informative message when the user gives unexpected input.
You can read more about signalling conditions (messages, warnings, & errors) in 
[Advanced R]( https://adv-r.hadley.nz/conditions.html) 
or check out [this older code club](https://github.com/SchlossLab/exception-handling).

## Automate

The [GitHub Actions](https://docs.github.com/en/free-pro-team@latest/actions) 
workflow in [`.github/workflows/tests.yml`](.github/workflows/tests.yml) 
executes `tests/testthat.R` to run all tests in `tests/testthat/` whenever there 
is a change in `code/` or `tests/testthat/`.
The test badge ![test](https://github.com/SchlossLab/intro-testing-r/workflows/tests/badge.svg)
reports the status of this workflow.
GitHub will email you if any of your workflows fail,
so you'll know if you accidentally break your code.
Alternatively, you can turn those notifications off if ignorance is bliss.
You can **copy the workflow file to your own repo** if you'd like to use it.
If your code is in some other directory than `code/` 
(e.g. `R/` and `src/` are other common names), 
you'll need to modify that path in the yaml file.

If you're developing an R package, you might like to use the `covr` package
to report code coverage and `devtools` to check other aspects of your package.
See examples of package-specific workflows [here](https://github.com/SchlossLab/mikropml/tree/master/.github/workflows)
and the [r-lib/actions repo](https://github.com/r-lib/actions) for even more!

## Resources

- [R Packages chapter on testing](https://r-pkgs.org/tests.html).
- [Discussion on using `testthat` outside the context of a package](https://github.com/r-lib/testthat/issues/659).
- [`testthat` documentation](https://testthat.r-lib.org/).
- [Advanced R chapter on conditions](https://adv-r.hadley.nz/conditions.html).
