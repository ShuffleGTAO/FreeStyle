local dbname = "db_9591"
local host = "sql-waw1.ServerProject.pl"
local username = "db_9591"
local pass = "aeb09ff1464d"



local pol = dbConnect("mysql", "dbname="..dbname..";host="..host.."", ""..username.."",""..pass.."","share=1")


function wykonajKwerende ( ... )
	local q = dbQuery ( pol, ... )
	if not q then
		return nil
	end
	return dbPoll ( q, -1 )
end


--PRAWO JAZDY

local x_spawnu_pojazdu = -2491.59595 
local y_spawnu_pojazdu = 2336.16406 
local z_spawnu_pojazdu = 4.98499


function coreSpawnLicenseCar ()
	return x_spawnu_pojazdu, y_spawnu_pojazdu, z_spawnu_pojazdu
end