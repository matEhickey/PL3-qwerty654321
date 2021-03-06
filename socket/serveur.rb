require 'socket'
require './Sauvegarde.rb'




def sortie( server )
	begin
		
		server.close
		
	ensure
		
		exit
	end
end


server = TCPServer.new 10000 # Server bound to port 10000
parties = Array.new
Signal.trap("INT") do
	sortie server
end

Signal.trap("QUIT") do
	sortie server
end



	while(true) do 
		client = server.accept    # Wait for a client to connect
	
	
		proc=Thread.new{
			p "nouveau client : #{client}"
			line = ""
			recu = 0
		
		
				
				line = client.recv(100)	#valeur arbitraire, au moins ca marche
				recu += 1
				#print line
				begin
					partie = Sauvegarde.fromMarsh(line)
					#puts "Recu de\t#{client} :\n  #{partie}\n"
					parties.push(partie)
					
					parties.sort! { |x,y| 
						y.score <=> x.score		
					}
					

					if(partie.fini == true)
						puts "\n---------------------------\nTable des scores:\n\n"
						parties.each{ |part|
							if(part.fini == true)
								puts part
							end
						}
						puts "\n---------------------------\n"
					end
					
				rescue
					puts "Probleme avec Sauvegarde.fromMarsh"
				end
				#print " #{client} vient de se deconnecter\n"
				client.close 
				#exit
		
		
			
	
		}
	end
	
	#client.close
	#exit

