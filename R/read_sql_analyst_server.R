#' Read Data
#' from Midlands and Lancashire CSU
#' Business Intelligence Analyst SQL Server
#'
#' This function allows the user to connect
#' to the commonly used analyst server directly to access data
#'
#' The only input needed is the SQL query used to generate the data
#'
#' @importFrom DBI dbConnect
#' @importFrom odbc odbc
#'
#'
#'
#'
#' @param sql_query A SQL Query to read data from the
#'                    Midlands and Lancashire CSU Analyst Server.
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
#' example_sql_query <- "
#'                     SELECT TOP (1000) *
#'                     FROM EAT_Reporting.dbo.tbInpatientEpisodes
#'                    "
#'
#' # pass the SQL query to the read_sql_analyst_Server
#' #     function to read the data in
#' episodesData <- read_sql_analyst_Server(example_sql_query)
#'
#' @export
#'
read_sql_analyst_Server <- function(sql_query) {
  # create a connection to MLCSU analyst server using user credentials

  connection <- DBI::dbConnect(odbc::odbc(),
                               Driver = "SQL Server",
                               Server = "MLCSU-BI-SQL",
                               Database = "AnalystGlobal",
                               Trusted_Connection = "True"
  )

  # use the input variable sql_query to get data from the analyst server
  DBI::dbGetQuery(connection, sql_query)
}
