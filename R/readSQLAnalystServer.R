
# the following block i used used to automatically manage
# roxygen namespace tags
#' Read data from Midlands and Lancashire CSU Analyst SQL Server
#'
#' Read Data from Midlands and Lancashire CSU Business Intelligence Analyst SQL Server
#'
#' This function allows the user to connect to the commonly used analyst server directly to access data
#'
#' The only input needed is the SQL query used to generate the data
#'
#' @importFrom DBI dbConnect
#' @importFrom odbc odbc
#'
#'
#'
#'
#' @param SQLQuery A SQL Query to read data from the Midlands and Lancashire CSU Analyst Server.
#'
#' @return A dataset taken from Midlands and Lancashire CSU SQL Analyst Server
#'
#'
#' @examples
#'
#'
#'
#' library(MLCSUr)
#'
#' # write a SQL query to import the data you require
#' exampleSQLQuery <- "SELECT TOP (1000) * FROM EAT_Reporting.dbo.tbInpatientEpisodes"
#'
#' # pass the SQL query to the readSQLAnalystServer function to read the data in
#' episodesData <- readSQLAnalystServer(exampleSQLQuery)
#'
#'
#' @export
#'
readSQLAnalystServer <- function(SQLQuery) {
  # create a connection to MLCSU analyst server using user credentials

  connection <- DBI::dbConnect(odbc::odbc(),
    Driver = "SQL Server",
    Server = "MLCSU-BI-SQL",
    Database = "AnalystGlobal",
    Trusted_Connection = "True"
  )

  # use the input variable SQLQuery to get data from the analyst server
  DBI::dbGetQuery(connection, SQLQuery)
}
