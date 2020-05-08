#' Run docker stats
#'
#' Run docker stats and returns a data.frame
#'
#' @param ... Subset of containers to get stats from. If empty, all running containers are looked for.
#' @param all Show all containers (default shows just running).
#' @param notrunc Whether or not to truncate output.
#' @param extra Extra information to add in the "extra" column.
#'
#' @details
#'
#' Output description:
#'
#' + CONTAINER ID and Name	the ID and name of the container
#' + CPU % and MEM %	the percentage of the host’s CPU and memory the container is using
#' + MEM USAGE / LIMIT	the total memory the container is using, and the total amount of memory it is allowed to use
#' + NET I/O	The amount of data the container has sent and received over its network interface
#' + BLOCK I/O	The amount of data the container has read to and written from block devices on the host
#' + PIDs	the number of processes or threads the container has created
#'
#' From <https://docs.docker.com/engine/reference/commandline/stats/>
#'
#' @note
#'
#' MemPerc and PIDs are not available on Windows
#'
#' @return A data.frame with the docker stats with class `"dockerstats"` append, for later expansion
#'     (not used currently).
#' @export
#' @importFrom utils read.delim
#' @examples
#' if (interactive()){
#'     if (dockerstats_available()) {
#'         dockerstats()
#'     }
#' }
dockerstats <- function(
  ...,
  all = FALSE,
  notrunc = FALSE,
  extra = ""
) {

  com <- "docker stats --no-stream"
  if (notrunc){
    com <- sprintf(
      "%s %s",
      com,
      "--no-trunc"
    )
  }
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

  output <- system(
    com,
    intern = TRUE
  )

  if (length(output) == 0){
    cat("Unable to find any container running.\n")
    return(
      structure(
        list(
          character(0),
          character(0),
          character(0),
          character(0),
          character(0),
          character(0),
          character(0),
          character(0),
          character(0),
          character(0),
          character(0),
          character(0),
          character(0),
          character(0)
        ),
        .Names = docker_stats_names,
        row.names = integer(0),
        class = "data.frame"
      )
    )
  } else {
    res  <- read.delim(
      stringsAsFactors = FALSE,
      text =  output,
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
    class(res) <- c("dockerstats", class(res))
    res[, docker_stats_names]
  }


}

#' Names of the outputs
docker_stats_names <- c(
  "Container",
  "Name",
  "ID",
  "CPUPerc",
  "MemUsage",
  "MemLimit",
  "MemPerc",
  "NetI",
  "NetO",
  "BlockI",
  "BlockO",
  "PIDs",
  "record_time",
  "extra"
)
