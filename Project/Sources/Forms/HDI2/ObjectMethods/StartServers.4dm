Form:C1466.lightBulbServer:=cs:C1710.HouseDeviceServer.new(19820; "Light is on!"; "Light is off!")
Form:C1466.thermometerServer:=cs:C1710.HouseDeviceServer.new(19821; "It's warm."; "It's freezing!")
Form:C1466.alarmServer:=cs:C1710.HouseDeviceServer.new(19822; "Alarm is on!\r\n Nothing to report."; "Alarm is off! You should turn it on.")
Form:C1466.musicServer:=cs:C1710.HouseDeviceServer.new(19823; "Music is playing but no one is listening..."; "Music is not playing!")
Form:C1466.plantServer:=cs:C1710.HouseDeviceServer.new(19824; "You need to learn more about biology..."; "It grows!")

OBJECT SET ENABLED:C1123(*; "StartServers"; False:C215)