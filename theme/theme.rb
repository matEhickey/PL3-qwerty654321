require 'gtk2'

class Theme
	
	@boutons
	@couleurPrincipale
	@couleurSecondaire
	
	attr_reader :couleurPrincipale
	attr_reader :couleurSecondaire
	def initialize(numero)
		@boutons= Array.new
		
		if(numero == 1)
			@boutons.push Gtk::Image.new("../boutons/button-red.png")
			@boutons.push Gtk::Image.new("../boutons/button-blue.png")
			@boutons.push Gtk::Image.new("../boutons/button-yellow.png")
			
			@couleurPrincipale = nil
			@couleurSecondaire = nil
		elsif (numero == 2)
			
			@boutons.push Gtk::Image.new("../boutons/button-red.png")
			@boutons.push Gtk::Image.new("../boutons/button-blue.png")
			@boutons.push Gtk::Image.new("../boutons/button-yellow.png")
			
			@couleurPrincipale = nil
			@couleurSecondaire = nil
		else 
			
			@boutons.push Gtk::Image.new("../boutons/button-red.png")
			@boutons.push Gtk::Image.new("../boutons/button-blue.png")
			@boutons.push Gtk::Image.new("../boutons/button-yellow.png")
			
			@couleurPrincipale = nil
			@couleurSecondaire = nil
		end
	end
	
	def image(etat)
		return @boutons[etat]
	end
	
	def Theme.test
	
		Gtk.init
	
		window = Gtk::Window.new
		window.signal_connect('destroy'){Gtk.main_quit}
		3.times{|i|
			a = Theme.new 1
			3.times{|j|
				puts a.image(j).file
			}
		}
		hb = Gtk::HBox.new
		button = Gtk::Button.new().set_label("Coucou")
		button.signal_connect('clicked'){Gtk.main_quit}
		window.add hb.add button
		
		window.show_all
		Gtk.main
	end
	
end

	
Theme.test
