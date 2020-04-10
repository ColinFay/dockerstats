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
