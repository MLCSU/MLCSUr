# Read data from Midlands and Lancashire CSU Business Intelligence Analyst SQL Server
#
# This function allows the user to connect to the commonly used analyst server directly to access data
#
# The only input needed is the SQL query used to generate the data
#


readSQLAnalystServer <- function(SQLQuery) {

  connection <-dbConnect(odbc(),
                         Driver="SQL Server",
                         Server="MLCSU-BI-SQL",
                         Database="AnalystGlobal",
                         Trusted_Connection="True")

  dbGetQuery(connection, SQLQuery)


                                            }
