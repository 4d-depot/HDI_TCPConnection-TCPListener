property listener : 4D:C1709.TCPListener
property activated : Boolean
property informationActivated; informationDeactivated : Text

Class constructor($port : Integer; $informationActivated : Text; $informationDeactivated : Text)
	
	This:C1470.listener:=4D:C1709.TCPListener.new($port; This:C1470)
	This:C1470.activated:=False:C215
	This:C1470.informationActivated:=$informationActivated
	This:C1470.informationDeactivated:=$informationDeactivated
	
Function activate()
	This:C1470.activated:=Not:C34(This:C1470.activated)
	
Function information()->$information
	
	If (This:C1470.activated)
		return This:C1470.informationActivated
	Else 
		return This:C1470.informationDeactivated
	End if 
	
Function terminate()
	
	This:C1470.listener.terminate()
	
Function onConnection($connection : 4D:C1709.TCPListener; $event : 4D:C1709.TCPEvent)->$result
	
	$result:=cs:C1710.HouseDeviceServerConnection.new(This:C1470)
	
Function onError($connection : 4D:C1709.TCPListener; $event : 4D:C1709.TCPEvent)
	
Function onTerminate($connection : 4D:C1709.TCPListener; $event : 4D:C1709.TCPEvent)
	