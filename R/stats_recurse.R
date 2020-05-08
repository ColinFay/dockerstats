#' Call dockerstats() recursively
#'
#' @inheritParams dockerstats
#' @param every Loop duration
#' @param callback function to call on each loop, with the first argument being the result of `dockerstats()`.
#'
#' @return Nothing, primarly called for its side-effect.
#'
#' @export
#' @examples
#' if (interactive()){
#'     if (dockerstats_available()) {
#'         dockerstats_recurse()
#'     }
#' }
dockerstats_recurse <- function(
  ...,
  all = FALSE,
  extra = "",
  every = 1,
  callback = print
){
  message("Starting `dockerstats_recurse()`")
  message("To stop the process, press CTRL + C")
  while(TRUE){
    callback(
      dockerstats(..., all = all, extra  = extra)
    )
    Sys.sleep(every)
  }
}
