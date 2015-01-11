local dbname = "x"
local host = "x"
local username = "x"
local pass = "x"



local pol = dbConnect("mysql", "dbname="..dbname..";host="..host.."", ""..username.."",""..pass.."","share=1")


function wykonajKwerende ( ... )
	local q = dbQuery ( pol, ... )
	if not q then
		return nil
	end
	return dbPoll ( q, -1 )
end