# Read data from Midlands and Lancashire CSU Business Intelligence Analyst SQL Server
#
# This function allows the user to connect to the commonly used analyst server directly to access data
#
# The only input needed is the SQL query used to generate the data
#

#define function name and input variable
readSQLAnalystServer <- function(SQLQuery) {


#create a connection to MLCSU analyst server using user credentials

  connection <-DBI::dbConnect(odbc::odbc(),
                         Driver="SQL Server",
                         Server="MLCSU-BI-SQL",
                         Database="AnalystGlobal",
                         Trusted_Connection="True")

#use the input variable SQLQuery to get data from the analyst server
  dbGetQuery(connection, SQLQuery)


                                            }
