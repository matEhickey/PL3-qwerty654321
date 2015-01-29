# encoding: UTF-8

##
# Auteur MATHIAS DIDIER

require 'gtk2'
require './../socket/Sauvegarde.rb'



class DialoogBox < Gtk::Builder

	@sauvegarde 
  def initialize(sauvegarde)
    super()
    self.add_from_file(__FILE__.sub(".rb",".glade"))
    
    self['dialog1'].set_window_position Gtk::Window::POS_CENTER
    self['dialog1'].signal_connect('destroy') { Gtk.main_quit }
    self['dialog1'].show_all
    
    # Creation d'une variable d'instance par composant glade
    self.objects.each() { |p|
        instance_variable_set("@#{p.builder_name}".intern, self[p.builder_name])
     }
     @label_info_partie.set_label(sauvegarde.to_s)
     

     self.connect_signals{ |handler| 
        puts handler
        method(handler)
      }
  end



end

#Gtk.init
#dialoog = Dialoog.new()
#Gtk.main
