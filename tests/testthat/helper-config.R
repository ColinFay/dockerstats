skip_if_no_docker <- function() {

  if (Sys.which("docker") == ""){
    testthat::skip(message = "No docker Backend available")
  }

  x <- suppressWarnings(
    system(
      "docker ps",
      ignore.stdout = TRUE,
      ignore.stderr = TRUE
    )
  )
  if (x != 0){
    testthat::skip(message = "No docker Backend available")
  }
}
