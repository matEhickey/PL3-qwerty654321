require 'gtk2'

class Theme
	
	
	@couleurPrincipale
	@couleurSecondaire
	@boutons
	@numero
	
	
	attr_reader :couleurPrincipale
	attr_reader :couleurSecondaire
	
	def initialize(numero)
		 @numero = numero
		 @boutons = Array.new
		
		if(numero == 1)
			@boutons.push Gtk::Image.new("../Images/button-red.png")
			@boutons.push Gtk::Image.new("../Images/button-blue.png")
			@boutons.push Gtk::Image.new("../Images/button-yellow.png")
			
			@couleurPrincipale = nil
			@couleurSecondaire = nil
		elsif (numero == 2)
			
			
			@boutons.push Gtk::Image.new("../Images/button-blue.png")
			@boutons.push Gtk::Image.new("../Images/button-yellow.png")
			@boutons.push Gtk::Image.new("../Images/button-red.png")
			
			@couleurPrincipale = nil
			@couleurSecondaire = nil
		else 
			
			@boutons.push Gtk::Image.new("../Images/button-yellow.png")
			@boutons.push Gtk::Image.new("../Images/button-red.png")
			@boutons.push Gtk::Image.new("../Images/button-blue.png")
			
			@couleurPrincipale = nil
			@couleurSecondaire = nil
		end
	end
	
	def image(etat)
		return @boutons[etat]
	end
	
	def Theme.test
	
		Gtk.init
		
		th1 = Theme.new(1)
		window = Gtk::Window.new
		window.signal_connect('destroy'){Gtk.main_quit}
		
		
		
		@@j = 0
		
			vb = Gtk::VBox.new
			3.times{|i|
				
				button = Gtk::Button.new()
				button.signal_connect('clicked'){
					th1 = Theme.new(@@j)
					button.set_image th1.image(@@j)
					@@j=(@@j+1)%3
				}
				button.set_image th1.image((i)%3)
				vb.add button
				puts "case"
			}
			
		
		window.add vb
		
		window.show_all
		Gtk.main
	end
	
end

	
#Theme.test
