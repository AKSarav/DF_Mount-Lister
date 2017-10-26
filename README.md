# DF_Mount-Lister
 A Shell script ( actually set of shell scripts) designed to remote login[SSH] to the list of servers by reading the ssh password from the property file and pull the DF related information and print it as Console Report with GOOD FORMATTING (or) Generate a CSV REPORT 

 

# How its designed ?

There are  3 shell scripts and 2 text files which help you to obtain the result what you want. Let me explain what each one of them doing.

**getfs.sh** -  A main script to be executed to pull the data from various servers

**serverlist** - A text file contains the server name in a stack [ line after line ]

**password.txt** - A file to be used to enter your password secretly while executing the script 
###### Notes: 
###### this *password.txt* file will be removed after every execution for security purpose
###### The script is designed with an assumption that there will be single username&password to all the provided servers. so you can pass only one password in the file

**DF_unixreport.sh** – A script prints the well formatted  report to your console

**DF_csvreport.sh** – A script generates the CSV report and save it with date and timestamp i.e DFREPORT_155601-25Oct17.csv


# How to Use  It ?

###### Step1:

Create a Directory in any of your desired location in my case its */tmp/dfscript*

###### Step2:

Copy those aforementioned scripts  into your working directory */tmp/dfscript*  and create *password.txt* and *serverlist* by your own

###### Step3:

Update the *password.txt* with your SSH password

###### Step4:

Update the *serverlist* file with the list of servers.

```
aksarav@testweblogic03> cat serverlist
testweblogic01
testweblogic02
devjboss01
devjboss02
```

###### Step5:

Start the script getfs.sh with your SSH user id as startup argument (commandline arguement)
> The script is designed with an assumption that there will be single username&password to all the provided servers. so you can pass only one username as a startup arguement


``` ./getfs.sh <sshuserid> ```

# Trial run 

```
aksarav@testweblogic03> ./getfs.sh aksarav

Server List file present
Password file is present

Connecting to the server: dldbmtomcat01
Output file Generated:  DFDATA_dldbmtomcat01.OUT

Connecting to the server: dlnpapp01
Output file Generated:  DFDATA_dlnpapp01.OUT

Removing the password.txt file for Security purpose

Done!
```
this will execute a command to the remote host and save the output in “.OUT” file, which will be used as a RAW data for the report generation

###### Step 6:

Generate a console report by executing *./DF_unixreport.sh*

> Formatting could have been bit broken when here, It would not be the case in the terminal

```
sthangar@testweblogic03> ./DF_unixreport.sh

NFS REPORT:
-----------------------------------------------------------------------------------------------------------------------------
SERVER_NAME          FILESYSTEM                                                                       TYPE       MOUNTED ON
-----------------------------------------------------------------------------------------------------------------------------
testweblogic02       nfsserver.mwinventory.in:/images                                        		  nfs          /images
testweblogic02       nfsserver.mwinventory.in:/app-data                                               nfs          /appdata
testweblogic01       nfsserver.mwinventory.in:/sql-reports                                            nfs          /sqlrep
testweblogic01       nfsserver.mwinventory.in:/app-data                                               nfs          /appdata


XFS REPORT:
-----------------------------------------------------------------------------------------------------------------------------
SERVER_NAME          FILESYSTEM                                                                       TYPE       MOUNTED ON
-----------------------------------------------------------------------------------------------------------------------------
testweblogic02       /dev/mapper/rootvg-root                                       		  			  xfs          /
testweblogic02       /dev/mapper/rootvg-opt                                                           xfs          /opt
testweblogic01       /dev/mapper/rootvg-root                                                          xfs          /
testweblogic01       /dev/mapper/rootvg-opt                                                           xfs          /opt
testjboss01          /dev/mapper/rootvg-root                                       		  			  xfs          /
testjboss01          /dev/mapper/rootvg-opt                                                           xfs          /opt
testjboss02          /dev/mapper/rootvg-root                                       		  			  xfs          /
testjboss02          /dev/mapper/rootvg-opt                                                           xfs          /opt

```

## Step 6a:

Generate a CSV Report by executing the *./DF_csvreport.sh*

```
aksarav@testweblogic03> ./DF_csvreport.sh
Report Generated : DFREPORT_163033-25Oct17.csv

```
