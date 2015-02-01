require 'gtk2'

class Grille < Gtk::Table
	@taille
	@boutons	#tableau de boutons
	def initialize(taille)
		@taille = taille
		grille = super(@taille,@taille,true)
		
		@boutons = Array.new(@taille,Array.new(@taille,nil))
		0.upto(taille){ |i|
			0.upto(taille){|j|
				cellule = Gtk::Button.new.show
				cellule.label = "     "
				cellule.signal_connect('clicked'){
					puts "appui sur bouton [#{i}:#{j}]"
					
					if(cellule.label == "     ")
						cellule.label = " 1 "
					elsif(cellule.label == " 1 ")
						cellule.label = " 0 "
					else
						cellule.label = "     "
					end
				}
				#grille.attach_defaults(cellule,i,i+1,j,j+1)
				#puts "creee : #{cellule}"
				@boutons[i].push(cellule)
			}
		}
		return grille
	end
	
	def Grille.creer(taille)
		Grille.new(taille)
		
	end
		
end
