# encoding: UTF-8

##
# Auteur MATHIAS DIDIER

require 'gtk2'
require './../socket/Sauvegarde.rb'



class DialoogBox < Gtk::Builder

	@sauvegarde 
	@finDuJeu
  def initialize(sauvegarde,finDuJeu)
    super()
    @finDuJeu = finDuJeu
    self.add_from_file(__FILE__.sub(".rb",".glade"))
    
    self['dialog1'].set_window_position Gtk::Window::POS_CENTER
    
    self['dialog1'].signal_connect('destroy') { self['dialog1'].destroy }
    self['dialog1'].show_all
    
    # Creation d'une variable d'instance par composant glade
    self.objects.each() { |p|
        instance_variable_set("@#{p.builder_name}".intern, self[p.builder_name])
     }
     @label_info_partie.set_label(sauvegarde.to_s)
     
	self['button_oui'].signal_connect('clicked') {
		a = Sauvegarde.creer("Mathias",1,100,30,false);
		begin
			a.envoi
			if(@finDuJeu)
				Gtk.main_quit
			else
				@dialog1.destroy
			end
			
		rescue
			puts "Erreur d'envoi"
		end
	}
     self.connect_signals{ |handler| 
        puts handler
        method(handler)
      }
  end



end

#Gtk.init
#dialoog = Dialoog.new()
#Gtk.main
