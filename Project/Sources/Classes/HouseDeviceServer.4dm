property listener : 4D:C1709.TCPListener
property activated : Boolean
property informationActivated; informationDeactivated : Text

//The constructor creates a TCPListener to listen to the port given in parameter
Class constructor($port : Integer; $informationActivated : Text; $informationDeactivated : Text)
	
	This:C1470.listener:=4D:C1709.TCPListener.new($port; This:C1470)
	This:C1470.activated:=False:C215
	This:C1470.informationActivated:=$informationActivated
	This:C1470.informationDeactivated:=$informationDeactivated
	
	//Stops the listener. Already opened TCPConnections are kept
Function terminate()
	
	This:C1470.listener.terminate()
	
	//Callback called everytime a new connection is attempted
	//Return an option object to create a TCPConnection if the connection is accepted
Function onConnection($listener : 4D:C1709.TCPListener; $event : 4D:C1709.TCPEvent)->$result
	
	$result:=cs:C1710.HouseDeviceServerConnection.new(This:C1470)
	
	//Function called when an error occurs on the port (in general because another application is already using it)
Function onError($listener : 4D:C1709.TCPListener; $event : 4D:C1709.TCPEvent)
	
	ALERT:C41("Error")
	
	//Function called when the listener is stopped
Function onTerminate($listener : 4D:C1709.TCPListener; $event : 4D:C1709.TCPEvent)
	
	ALERT:C41("Terminate")
	
Function activate()
	This:C1470.activated:=Not:C34(This:C1470.activated)
	
Function information()->$information
	
	If (This:C1470.activated)
		return This:C1470.informationActivated
	Else 
		return This:C1470.informationDeactivated
	End if 
	