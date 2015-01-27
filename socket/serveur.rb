require 'socket'
require './Sauvegarde.rb'




def sortie( server )
	begin
		
		server.close
		
	ensure
		
		exit
	end
end


server = TCPServer.new 2002 # Server bound to port 2002

Signal.trap("INT") do
	sortie server
end

Signal.trap("QUIT") do
	sortie server
end



	while(true) do 
		client = server.accept    # Wait for a client to connect
	
	
		procClient = fork{
			p "nouveau client : #{client}"
			line = ""
			recu = 0
		
		
				
				line = client.gets
				recu += 1
				print "Recu de #{client} :\t"
				print line
				print Marshal.load(line)
				
				print " #{client} vient de se deconnecter\n"
				client.close 
				exit
		
		
			
	
		}
	end
	
	client.close
	exit

