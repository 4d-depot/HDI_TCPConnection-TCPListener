Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		InitInfo
		
		Form:C1466.lightBulb:=cs:C1710.HouseDeviceClient.new(Form:C1466; 19820)
		Form:C1466.thermometer:=cs:C1710.HouseDeviceClient.new(Form:C1466; 19821)
		Form:C1466.alarm:=cs:C1710.HouseDeviceClient.new(Form:C1466; 19822)
		Form:C1466.music:=cs:C1710.HouseDeviceClient.new(Form:C1466; 19823)
		Form:C1466.plant:=cs:C1710.HouseDeviceClient.new(Form:C1466; 19824)
		
	: (Form event code:C388=On Close Box:K2:21)
		If (Is Windows:C1573 && Application info:C1599().SDIMode)
			QUIT 4D:C291
		Else 
			If (Not:C34(Undefined:C82(Form:C1466.lightBulbServer)))
				Form:C1466.lightBulbServer.terminate()
			End if 
			If (Not:C34(Undefined:C82(Form:C1466.thermometerServer)))
				Form:C1466.thermometerServer.terminate()
			End if 
			If (Not:C34(Undefined:C82(Form:C1466.alarmServer)))
				Form:C1466.alarmServer.terminate()
			End if 
			If (Not:C34(Undefined:C82(Form:C1466.musicServer)))
				Form:C1466.musicServer.terminate()
			End if 
			If (Not:C34(Undefined:C82(Form:C1466.plantServer)))
				Form:C1466.plantServer.terminate()
			End if 
			CANCEL:C270
		End if 
		
End case 

