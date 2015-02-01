require 'gtk2'

class Cellule < Gtk::Button
	
	@etat #1,0,2	#2 = vide
	@bloque		#booleen
	@soluce
	@images		#tableau d'image
	@theme
		
	
	def initialize(bloque,soluce)
		super()
		@etat,@bloque,@soluce = 2,bloque,soluce
		@images= Array.new
		@images.push Gtk::Image.new("../Images/button-red.png")
		@images.push Gtk::Image.new("../Images/button-blue.png")
		@images.push Gtk::Image.new("../Images/button-yellow.png")
		if(@bloque)
			@etat = @soluce
			relief = Gtk::RELIEF_NONE	#ne marche apparent pas(mais pe que sur mon pc), trouver qq chose dans le mm genre
		end
		set_image @images.at(@etat)	#image de la case vide
		return @self
	end
	
	def Cellule.creer(bloque,soluce)
		cellule = new(bloque,soluce)
		return cellule
	end
	
	def vide?
		return(@etat == 2)
	end
	
	def resoudre
		@etat = @soluce
		set_image @images.at(@etat)
	end
	
	def estCorrect
		return(@etat == @soluce)
	end
	
	def onClic
		if(@bloque == false)
			case(@etat)
				when 2
					@etat = 1
					set_image @images.at(1)
				when 1
					@etat = 0
					set_image @images.at(0)
				when 0
					@etat = 2
					set_image @images.at(2)
			end
		end
		
	end	
	
end
