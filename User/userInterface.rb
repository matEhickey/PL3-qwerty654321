# encoding: UTF-8

##
# Auteur MATHIAS DIDIER

require 'gtk2'
require '../Partie/partie.rb'
require '../image_user/selecteurDimage.rb'

class UserInterface < Gtk::Builder
	
	@fenetreMenu
	
	
  def initialize (fenetreMenu)
    super()
    @fenetreMenu = fenetreMenu
    @fenetreMenu.hide
    self.add_from_file(__FILE__.sub(".rb",".glade"))
    
    self['window1'].set_window_position Gtk::Window::POS_CENTER
    self['window1'].signal_connect('destroy') { 
    		@window1.hide
    		@fenetreMenu.show
    }
    self['window1'].show_all
    
    # Creation d'une variable d'instance par composant glade
    self.objects.each() { |p|
        instance_variable_set("@#{p.builder_name}".intern, self[p.builder_name])
     }

     self.connect_signals{ |handler| 
        puts handler
        method(handler)
      }
  end


def jouerPartie(bouton)
	case(bouton)
		
		when @partie6
			taille = 6
		when @partie8
			taille = 8
		when @partie10	
			taille = 10
		when @partie12
			taille = 12
	end
	Partie.new(taille,"____________",@window1)
	
end

def reprendrePartie()
		puts "reprendrePartie, A faire:"
		puts "charger grille du fichier sauvegardé, et le score/temps"
		puts "pour cela, appel personalisé au fichier partie.rb"
	
end

def load_image
		puts "appel a load_image"
		pipeReader,pipeWritter = IO.pipe
		@selecteurDimage = SelecteurDimage.new(pipeWritter);
		t1 = Thread.new(){
				begin
				filename = pipeReader.gets.delete!("\n")
				#@imageUser.file=(filename)			activer cette ligne quand on saura comment redimensionner une image
				
					puts "Working, plus qu'a savoir comment redimensionner image"
				rescue
					puts "------Not working------"
				end
		}
		
		
	end

end


