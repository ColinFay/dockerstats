# Based on https://support.google.com/websearch/answer/3284611?hl=fr#unitconverter
b_c <- c(
  "b" = 1,
  "kib" = 125,
  "mib" = 1049000,
  "gib" = 1.074e+9
)

kb_c <- c(
  "b" = 1/1024,
  "kib" = 1,
  "mib" = 1024,
  "gib" = 1049000
)

mb_c <- c(
  "b" = 1/1.049e+6,
  "kib" = 1/1024,
  "mib" = 1,
  "gib" = 1024
)

gb_c <- c(
  "b" = 1/1.074e+9,
  "kib" = 1/1.049e+6,
  "mib" = 1/1024,
  "gib" = 1
)

convertor <- function(
  units,
  convert_table,
  unit
){
  vals <- as.numeric(
    gsub(
      "([0-9\\.]+).*$", "\\1", units
    )
  )
  suffixes <- tolower(
    gsub(
      "[0-9\\.]+(.*)$", "\\1", units
    )
  )
  res <- unname(vals * convert_table[suffixes])
  attr(res, "unit") <- unit
  res
}


#' Convert Byte notation to Numeric
#'
#' These function turnsbyte notation to numeric using a
#' byte conversion. Useful for turning the `memUsage` column
#' to numeric.
#'
#' @note
#'
#' The following table are used, based on Google Unit converter:
#'
#' ## bytes
#' + "b" = 1,
#' + "kib" = 125,
#' + "mib" = 1049000,
#' + "gib" = 1.074e+9
#' +
#' ## kib
#' + "b" = 1/1024,
#' + "kib" = 1,
#' + "mib" = 1024,
#' + "gib" = 1049000
#'
#' ## mib
#' + "b" = 1/1.049e+6,
#' + "kib" = 1/1024,
#' + "mib" = 1,
#' + "gib" = 1024
#'
#' ## mib
#' + "b" = 1/1.074e+9,
#' + "kib" = 1/1.049e+6,
#' + "mib" = 1/1024,
#' + "gib" = 1
#'
#' @param units A character vector to convert to bytes
#'
#' @export
#' @rdname byte-conversion
#' @examples
#' un <- c("55.12kiB","12.09MiB","21.75GiB","467.2MiB","42.91MiB")
#' to_b(un)
#' to_kib(un)
#' to_mib(un)
#' to_gib(un)
to_b <- function(
  units
){
  convertor(units, b_c, "b")
}

#' @export
#' @rdname byte-conversion
to_kib <- function(
  units
){
  convertor(units, kb_c, "kib")
}

#' @export
#' @rdname byte-conversion
to_mib <- function(
  units
){
  convertor(units, mb_c, "mib")
}

#' @export
#' @rdname byte-conversion
to_gib <- function(
  units
){
  convertor(units, gb_c, "gib")
}

