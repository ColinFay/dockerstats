#' Append a csv file and read it in R
#'
#' `append_csv()` returns a function that can the be used to
#' append a csv with a dataframe content.
#' The returned function is write.table() with the following
#' parameters : `append = TRUE, col.names = FALSE, row.names = FALSE, sep = ","`.
#'
#' `read_appended_csv()` is a wrapper around `read.csv()`,.
#' so please use that function for more control over the
#' reading.
#'
#' @param print Should the result be printed to the console?
#' @inheritParams utils::read.table
#'
#' @return `append_csv()` returns a function that can write a dataframe to a file.
#'     `read_appended_csv()` returns a data.frame with the content of the read csv.
#'
#' @rdname csv
#' @importFrom utils write.table read.csv
#' @export
#' @examples
#' if (interactive()){
#'     if (dockerstats_available()) {
#'         fls <- tempfile(fileext = ".csv")
#'         write_it <- append_csv(fls)
#'         write_it(dockerstats())
#'         read_appended_csv(fls)
#'     }
#' }
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

#' @rdname csv
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
