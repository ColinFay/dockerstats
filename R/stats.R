#' Run docker stats
#'
#' Run docker stats and returns a data.frame
#'
#' @param ... Subset of containers to get stats from. If empty, all running containers are looked for.
#' @param all Show all containers (default shows just running).
#'
#' @return A data.frame
#' @export
dockerstats <- function(
  ...,
  all = FALSE
) {

  com <- "docker stats --no-stream --no-trunc"
  if (all){
    com <- sprintf(
      "%s %s",
      com,
      "--all"
    )
  }

  conts <- list(...)
  if (length(conts)){
    com <- sprintf(
      "%s %s",
      com,
      paste(conts, collapse = " ")
    )
  }
  com <- sprintf(
    "%s %s",
    com,
    '--format "{{.Container}},{{.Name}},{{.ID}},{{.CPUPerc}},{{.MemUsage}},{{.NetIO}},{{.BlockIO}},{{.MemPerc}},{{.PIDs}}"'
  )
  res  <- read.delim(
    text =  system(
      com,
      intern = TRUE
    ),
    header = FALSE,
    sep = ","
  )
  names(res) <- c(
    "Container",
    "Name",
    "ID",
    "CPUPerc",
    "MemUsage",
    "NetIO",
    "BlockIO",
    "MemPerc",
    "PIDs"
  )
  res$record_time <- as.character(
    Sys.time()
  )
  res
}
