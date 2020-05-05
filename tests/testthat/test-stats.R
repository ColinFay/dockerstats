test_that("dockerstats works", {
  skip_on_cran()
  skip_if_no_docker()
  res <- dockerstats()
  expect_is(res, "dockerstats")
  expect_is(res, "data.frame")
  for (i in docker_stats_names){
    expect_true(i %in% names(res))
  }
})
