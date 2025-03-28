property listener : 4D:C1709.TCPListener

Class constructor($listener)
	
	This:C1470.listener:=$listener
	
	//Callback called when the connection is successfully established
Function onConnection($connection : 4D:C1709.TCPConnection; $event : 4D:C1709.TCPEvent)
	
	//Callback called when the connection is properly closed
Function onShutdown($connection : 4D:C1709.TCPConnection; $event : 4D:C1709.TCPEvent)
	
	//Callback called when receiving data. The simple servers always send a sentence to show to the user
Function onData($connection : 4D:C1709.TCPConnection; $event : 4D:C1709.TCPEvent)
	
	$text:=BLOB to text:C555($event.data; UTF8 text without length:K22:17)
	
	//Warning: There's no guarantee you'll receive all the data you need in a single network packet.
	//To avoid complexifying this HDI, I haven't checked that I have all my data but you should do it especially if you send a lot of data.
	
	If ($text="Information")
		var $blob : Blob
		TEXT TO BLOB:C554(This:C1470.listener.information(); $blob; UTF8 text without length:K22:17)
		$connection.send($blob)
	Else 
		If ($text="Activate")
			This:C1470.listener.activate()
		End if 
	End if 
	
	//Callback called when the connection is closed unexpectedly
Function onError($connection : 4D:C1709.TCPConnection; $event : 4D:C1709.TCPEvent)
	
	//Callback called after onShutdown/onError just before the TCPConnection object is released
Function onTerminate($connection : 4D:C1709.TCPConnection; $event : 4D:C1709.TCPEvent)
	