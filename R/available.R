#' Is `docker stats` available?
#'
#' This function tries to lauch `docker stats` on the machine.
#' If the status code return by this command is not `0` (success),
#' this function will print a message and return FALSE.
#' If the return code is 0, this function invisibly return `TRUE`.
#'
#' @return `invisible(TRUE)` if `system("docker stats")` return 0, `invisible(FALSE)` otherwise.
#' @export
#'
#' @examples
#' if (interactive()){
#'     dockerstats_available()
#' }
dockerstats_available <- function() {
  x <- suppressWarnings(
    system(
      "docker stats",
      ignore.stdout = TRUE,
      ignore.stderr = TRUE
    )
  )
  if (x != 0){
    message("Unable to run `docker stats`.")
    return(invisible(FALSE))
  } else {
    return(invisible(TRUE))
  }
}
