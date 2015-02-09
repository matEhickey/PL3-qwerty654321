class AffichRegle < Gtk::Builder


	
  def initialize 
    super()
    self.add_from_file(__FILE__.sub(".rb",".glade"))
    
    self['dialog_affich_regles'].set_window_position Gtk::Window::POS_CENTER
    self['dialog_affich_regles'].signal_connect('destroy') { self['dialog_affich_regles'].hide }
    self['dialog_affich_regles'].show_all
    
    # Creation d'une variable d'instance par composant glade
    self.objects.each() { |p|
        instance_variable_set("@#{p.builder_name}".intern, self[p.builder_name])
     }

     self.connect_signals{ |handler| 
        #puts handler
        method(handler)
      }
      
      
     

  end

end
