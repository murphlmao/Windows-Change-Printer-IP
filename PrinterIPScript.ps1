# install printer driver before running this script

# $variable name ($ is to declare a variable)
# this script assumes your printer port is going to be TCP/IP

$portName = "TCP_10.1.40.16" # Port you want to add.

$printerDriverName = "LANIER MP C2003 PCL 6" # The printer driver you want to use.
$printerIPAddress = "10.1.40.16" #  The IP Address you want the printer to be at
$printerName = "Lainer MPC 2003" # Name you want the new printer to be

$oldPrinterPort = "TCP_10.1.40.132" # I want to remove this port
$oldPrinterName = "Lainer MPC 2003" # This is the name of the printer I want to remove.


# Remove printer stuff before readding it.
Remove-Printer -name $printerName # Must come first. You can't remove ports if the printer is still utilizing them.
Remove-PrinterPort $oldPrinterPort -ErrorAction SilentlyContinue # Continue if error
Remove-PrinterPort $oldPrinterName -ErrorAction SilentlyContinue

# Add new printer port, then printer.
Add-PrinterPort -name $portName -PrinterHostAddress $printerIPAddress # Set IP address: -PrinterHostAddress
Add-Printer -Name $printerName -PortName $portName -DriverName $printerDriverName 

Write-Host "Script is done."


# List of commands to get information about your printer:
#   Get-Printer
#   Get-PrinterDrive
#   Get-PrinterPort
