## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(scenes)

## ----req_accepts_language-----------------------------------------------------
req_accepts_language_impl <- function(request, language) {
  stringr::str_detect(
    tolower(request$HTTP_ACCEPT_LANGUAGE), 
    tolower(language)
  )
}
req_accepts_language_impl(
  list(HTTP_ACCEPT_LANGUAGE = "en-US,en;es-MX,es;fr-CA,fr"), 
  "fr"
)

## ----construct_action---------------------------------------------------------
req_accepts_language <- function(language) {
  construct_action(
    fn = req_accepts_language_impl,
    language = language,
    # We're using the defaults for these arguments, but I'll specify them for
    # clarity.
    negate = FALSE,
    methods = "GET"
  )
}

