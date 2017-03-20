require('socket');

port = 57; --private terminal access 

server = socket.bind('*', port);
io.write("Waiting at port: "..port.."\n");
cnx = server:accept();
io.write("Connection made: ")
while true do
	msg = cnx:receive();
	io.write(msg .. "\n");
	io.write("Server: ");
	cnx:send(io.read() .. "\n");
end
io.read();
