library(shiny)
source('/srv/shiny-server/app.R', local=TRUE)
testServer(server, {
  session$setInputs(bins=5)
  first <- output$histogram
  session$setInputs(bins=40)
  second <- output$histogram
  stopifnot(!is.null(first), !is.null(second), !identical(first, second))
})
cat('{"ok":true,"reactive_histogram_recomputed":true}\n')
