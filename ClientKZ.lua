require('socket')

while (0) then
	io.write("Choose a server (IP Address)> ")
	local server = {ip:match("(%d+)%.(%d+)%.(%d+)%.(%d+)")}
	    if (#server == 4) then
	        for _,v in pairs(server) do
	            if (tonumber(v) < 0 or tonumber(v) > 255) then
	                return 0
	            end
	        end
	        server = io.read()
	    else
		error("Invalid Input!\n")
	        return 0
	    end
end

io.write("Choose a port > ")
port = tonumber (io.read())
if not port then
	error("Invalid Input!\n")
end

client = socket.connect(server, port)

if client then
	io.write("You are connected!\n")
	while true do
		io.write("Client: ")
		client:send(io.read().."\n")
		reply = client:receive()
		io.write(reply .. "\n")
	end
end
