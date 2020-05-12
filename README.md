# RDS-Licence-resetter
Reset's RDS Licence Server Grace period. 

Simple powershell script that utilises Helge Klein's SetACL tool to gain access to and reset an RDS Server's grace period licence. 
The script writes a simple entry in an event log when the corret registry entry is disovered and removed or if it is not an event
is written to signify the server is not an RDS server. 
The script can be run as a regular scheduled task if required. 
This tool is meant for home lab type environments and should not be used in any production environments
