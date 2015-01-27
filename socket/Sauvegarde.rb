#require 'Marshal'
require 'socket'

class Sauvegarde
	
	@joueur
	@score	#Compteur de points
	@temps	#Temps en seconde
	@fini	#Booleen
	
	
	
	def initialize(joueur,score,temps,fini)
		@joueur,@score,@temps,@fini= joueur,score,temps,fini
	end
	
	def Sauvegarde.creer(joueur,score,temps,fini)
		new(joueur,score,temps,fini);
	end
	
	def toMarsh
		marsh = Marshal.dump(self)
		return marsh
	end
	
	def Sauvegarde.fromMarsh(data)
		p data
		retour = Marshal.load(data)
		return retour
	end
	
	def Sauvegarde.test
		a = Sauvegarde.creer("Mathias",100,30,false);
		print("#{a} \n\n")
		b=  a.toMarsh	
		#puts b
		#c = Sauvegarde.fromMarsh(b)
		#print "\n"
		#puts c
		a.envoi
		
	end
	
	def envoi	#envoi le fichier converti au serveur
		begin
			serveur = TCPSocket.new 'localhost', 2002
		rescue
			puts "Impossible de connecter au socket"
			exit
		end
		begin
			serveur.print(self.toMarsh)
		rescue
			puts "Impossible d'ecrire au serveur"
		ensure
			puts "fermeture du socket"
			begin
				serveur.close
			rescue
				puts "probleme fermeture socket"
			end
		end
		
	end
	
	def to_s
		return "Sauvegarde de #{@joueur}: score=#{@temps} temps=#{@temps}   fini ?#{@fini}"
	end
end

#Sauvegarde.test
		
