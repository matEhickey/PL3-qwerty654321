# encoding: UTF-8

##
# Auteur MATHIAS DIDIER

require 'gtk2'
require './../socket/Sauvegarde.rb'



class DialoogBox < Gtk::Builder

	@sauvegarde 
	@finDuJeu
	@fenetreUser
	@fenetrePartie
  def initialize(sauvegarde,finDuJeu,fenetreUser,fenetrePartie)
    super()
    @fenetreUser = fenetreUser
    @fenetrePartie = fenetrePartie
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
		a = Sauvegarde.creer("Mathias",1,100,30,true);
		begin
			a.envoi
			
		rescue
			puts "Erreur d'envoi"
		end
		@dialog1.destroy
		if(@finDuJeu)
			begin
				@fenetrePartie.hide
			ensure
				@fenetreUser.show
			end
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
