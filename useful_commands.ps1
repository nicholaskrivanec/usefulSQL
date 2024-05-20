$PSVersionTable.PSVersion   <# What version of Powershell you are running #>

<# GET-COMMAND #>
get-command | more                                      <# Gets cmdlets, functions, and aliases #>
get-command *update*                                    <# lists all commands with the word "update" in the name #>
get-command -Name *update*                              <# longer syntax #>
get-command -CommandType Function | measure-object      <# 1006 total commands that are functions  #>
get-command -verb new                                   <# searches commands that have a verb of new.  Commands are in <verb>-<noun> format #>
(get-command get-service) | get-member                  <# Lists all the Properties and Methods of get-service#>
(get-command get-service).Parameters.Values |           <# Lists all the parameters for get-service #>
>> select-object Name,Aliases,SwitchParameter | more


<# GET-HELP - alias: help - man in linux #>
(get-command get-service).Parameters                    <# lists all the parameters of the get-service command#>
get-help | more                                         <# displays help system summary. use ctrl c to close the more program #>]
get-help | out-host -Paging                             <# same as above, but using out-host -Paging to scroll one page at a time instead of just one line #>
get-help -Examples | more                               <# displays just the examples in the help file #>
help get-command   
help get-service
help *about*                                            <# lists all help files  with the word about in the name with a brief synopsis#>
help measure-object

<# GET HISTORY #>
get-history

<# LEARNING NEW COMMANDS; #>
get-command -Name *IP*                                  <# commands with IP in their names#>
get-command -Name *IP* -Module Net*                     <# Filter by Name and module start characters #>
get-command -Name *Ip* -Module NetTCPIP                 <# Filter by Name and exact module #>
help Get-NetIPAddress                                   <# Choose a command that looks most promising and read the help files #>
help Get-NetIPAddress -Examples | more                  <# Look at examples of how to use the command #>
Get-NetIPAddress                                        <# Finally, tryout the command #>

<# GET HISTORY #>
get-history                                                 <# Displays the History of the commands ran in powershell #>
invoke-history -id 2                                        <# will rerun the command from the history log with the given id #>
get-history | out-file X:\scripts\tran scipts\history.txt   <# Outputs the history to a file#>
clear-history                                               <# wipes the ps command history rerun get-history to verify #>

<# Using Start-Transcript to track PS sessions. Logs the powershell session to a given file from start-transcript to stop-transcript #>
help Start-Transcript                                       
Start-Transcript -path X:\scripts\transcripts\Transcript1.txt -Append   <# appends the transcript to the given file #>
Get-Service | where-object -Property Status -eq Stopped 
Stop-Transcript 
Notepad X:\scripts\transcripts\Transcript1.txt


<# Get-Member: displays all the Properties and Methods of an object type #>
help Get-Member   
get-service | get-member            <# gets data about the get-service object #>
get-service | get-member -Force     <##>
get-service | select-object Name,MachineName,Status | get-member   <# DOES NOT WORK, because it is only piping some of the object's properties to get-member#>
get-service | where-object status -eq "Stopped" | more 
get-service -DisplayName Client01,DC01 | where-object status -eq "Stopped" | select-object Name,MachineName,Status | sort-object MachineName | more


<# Example troubleshooting a user not being able to remote into a machine through rdp #>
get-command -Name *Fire* | more
get-command -Name get-*Fire* | more <#refined results#>

help get-netfirewallrule | more     <# read about a command that looks promising #>
get-netfirewallrule | get-member    <# look at the object the command returns #>
get-netfirewallrule | more          <# sometimes it's ok to run the command and see what happens #>

get-netfirewallrule -Name *RemoteDesktop* | FT      <# seeing the object has a name parameter, search for something containing the word remote #>
                                                    <# FT formats the output as a table to give you a better view of object data #>

get-netfirewallrule -Name *RemoteDesktop* | set-netfirewallrule -Enabled 'True' -Whatif <# -Whatif shows you what the changes would be, but doesn't actually execute the command #> | set-netf


get-eventlog -log system -newest 1000

<# FILE SEARCHING #>
    get-childitem -Path x:\ | get-member
    get-childitem -Path c:\ -Recurse | where Extension -EQ '.sln' | ft Directory,Name,LastWriteTime,Length 

<# ENVIRONMENT BUILT IN VARIABLES #>
    get-childitem env: | more

<# Search all drives for specific file#>
$Drives = Get-PSDrive -PSProvider 'FileSystem'

foreach($Drive in $drives) {

    #counts files in given directory
    Get-ChildItem -Path $Drive.Root -Recurse -File -ErrorAction SilentlyContinue -Force |
        Measure-Object |
        ForEach-Object { $_.Count }

    #select largest file in given directory
    Get-ChildItem -Path $Drive.Root -Recurse -File -ErrorAction SilentlyContinue -Force |
        Sort-Object Length -Descending |
        Select-Object -First 1

    #get average file size in a given directory
    Get-ChildItem -Path $Drive.Root -Recurse -File -ErrorAction SilentlyContinue -Force |
        Measure-Object -Property Length -Average

    #sum of file sizes in given directory 
    (Get-ChildItem -Path $Drive.Root -Recurse -File -ErrorAction SilentlyContinue -Force |
        Measure-Object -Sum Length).Sum

}