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