test_that("csv funs works", {
  skip_on_cran()
  skip_if_no_docker()
  fls <- tempfile(fileext = ".csv")
  write_it <- append_csv(fls)
  write_it(dockerstats())
  res <- read_appended_csv(fls)
  expect_is(res, "data.frame")
  for (i in docker_stats_names){
    expect_true(i %in% names(res))
  }
})
