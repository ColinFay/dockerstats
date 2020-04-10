#' Run docker stats
#'
#' Run docker stats and returns a data.frame
#'
#' @param ... Subset of containers to get stats from. If empty, all running containers are looked for.
#' @param all Show all containers (default shows just running).
#' @param extra Extra information to add in the "extra" column.
#'
#' @return A data.frame
#' @export
dockerstats <- function(
  ...,
  all = FALSE,
  extra = ""
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
    stringsAsFactors = FALSE,
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

  res$extra <- extra

  res$CPUPerc <- as.numeric(gsub("(.*)%$", "\\1",res$CPUPerc))
  res$MemPerc <- as.numeric(gsub("(.*)%$", "\\1",res$MemPerc))
  res$MemLimit <- gsub("[^/]*/ *(.*)", "\\1", res$MemUsage)
  res$MemUsage <- gsub("([^/]*) / .*", "\\1", res$MemUsage)
  res$NetO <- gsub("[^/]*/ *(.*)", "\\1", res$NetIO)
  res$NetI <- gsub("([^/]*) / .*", "\\1", res$NetIO)
  res$BlockO <- gsub("[^/]*/ *(.*)", "\\1", res$BlockIO)
  res$BlockI <- gsub("([^/]*) / .*", "\\1", res$BlockIO)
  res[, c("Container", "Name", "ID", "CPUPerc", "MemUsage", "MemLimit", "MemPerc", "NetI", "NetO","BlockI", "BlockO", "PIDs", "record_time", "extra")]
}
