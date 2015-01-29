# encoding: UTF-8


require 'socket'

class Sauvegarde
	
	@joueur
	@score	#Compteur de points
	@temps	#Temps en seconde
	@fini	#Booleen
	@grille
	
	attr_reader :joueur, :fini
	
	def initialize(joueur,grille,score,temps,fini)
		@joueur,@score,@temps,@fini,@grille= joueur,score,temps,fini,grille
	end
	
	def Sauvegarde.creer(joueur,grille,score,temps,fini)
		new(joueur,grille,score,temps,fini);
		
		
		
	end
	
	def toMarsh
		marsh = Marshal.dump(self)
		return marsh
	end
	
	def Sauvegarde.fromMarsh(data)
		#p data
		#begin
			retour = Marshal.load(data)
			return retour
		#rescue
		#	puts "Probleme Marshal.load"
		#	return "blablabla"
		#end
			
		
	end
	
	
	
	def envoi	#envoi le fichier converti au serveur
		begin
			serveur = TCPSocket.new 'localhost', 2002
		rescue
			puts "----Impossible de connecter au socket----"
			return -1
		end
		begin
			 message = self.toMarsh
			 puts "Envoi #{message}"
			 serveur.puts message
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
	
	def Sauvegarde.test
		a = Sauvegarde.creer("Mathias",1,100,30,false);
		#puts ("#{a} \n\n")
		#b=  a.toMarsh	
		#puts b
		#c = Sauvegarde.fromMarsh(b)
		#print "\n"
		#puts c
		a.envoi
		
	end
	
	def to_s
		return "Sauvegarde de #{@joueur}: \nGrille : #{@grille} score=#{@temps} temps=#{@temps}   fini ?#{@fini}"
	end
end

#Sauvegarde.test
		
