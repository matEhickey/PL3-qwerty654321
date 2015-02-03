# encoding: UTF-8

##
# Auteur MATHIAS DIDIER

require 'gtk2'
require '../Partie/partie.rb'


class UserInterface < Gtk::Builder

	
  def initialize 
    super()
    self.add_from_file(__FILE__.sub(".rb",".glade"))
    
    self['window1'].set_window_position Gtk::Window::POS_CENTER
    self['window1'].signal_connect('destroy') { 
    		@window1.destroy
    		
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
	Partie.new(taille,"____________")
end

end


