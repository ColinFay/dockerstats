#' Append a csv file
#'
#' @param print Should the result be printed to the console?
#' @param file the file to append the result to.
#'
#' @export
append_csv <- function(
  file,
  print = FALSE
){
  function(res){
    if (print){
      print(res)
    }
    write.table(
      res,
      file,
      append = TRUE,
      col.names = FALSE,
      row.names = FALSE,
      sep = ","
    )
  }
}

#' Read the csv from created by `append_csv()`
#'
#' This function is a wrapper around `read.csv()`.
#' Please use that function for more control over the
#' reading.
#'
#' @inheritParams utils::read.table
#'
#' @export
read_appended_csv <- function(
  file
){
  res <- read.csv(
    file,
    header = FALSE,
    col.names = docker_stats_names,
    stringsAsFactors = FALSE
  )
  res$record_time <- as.POSIXct(
    res$record_time
  )
  res
}
