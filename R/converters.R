# Based on https://support.google.com/websearch/answer/3284611?hl=fr#unitconverter
b_c <- c(
  "b" = 1,
  "kib" = 1024,
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
#' + "1b" = 1 bytes,
#' + "1kib" = 1024 bytes,
#' + "1mib" = 1049000 bytes,
#' + "1gib" = 1.074e+9 bytes
#' +
#' ## kib
#' + "1b" = 1/1024 kib,
#' + "1kib" = 1 kib,
#' + "1mib" = 1024 kib,
#' + "1gib" = 1049000 kib
#'
#' ## mib
#' + "1 b" = 1/1.049e+6 mib,
#' + "1 kib" = 1/1024 mib,
#' + "1 mib" = 1 mib,
#' + "1 gib" = 1024 mib
#'
#' ## gib
#' + "1b" = 1/1.074e+9 gib,
#' + "1kib" = 1/1.049e+6 gib,
#' + "1mib" = 1/1024 gib,
#' + "1gib" = 1 gib
#'
#' @param units A character vector to convert to bytes
#'
#' @return A character vector of size converted from the input. The
#'    `attr("unit")` contains the unit of the result.
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

