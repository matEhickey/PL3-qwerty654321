# encoding: UTF-8

##
# Auteur Groupe 2

require 'gtk2'
require './../socket/Sauvegarde.rb'
require './../Dialog_sauvegarde/dialoogBox.rb'




class Partie < Gtk::Builder
	@sauvegarde
	
  def initialize 
    super()
    self.add_from_file(__FILE__.sub(".rb",".glade"))
    
    self['window1'].set_window_position Gtk::Window::POS_CENTER
    self['window1'].signal_connect('destroy') { onDestroy }
    self['window1'].show_all
    @sauvegarde = Sauvegarde.new("Mathias",1,30,30,true)
    # Creation d'une variable d'instance par composant glade
    i=1
    self.objects.each() { |p|
    	puts "Instance #{i} : #{p}"
    	i+=1
        instance_variable_set("@#{p.builder_name}".intern, self[p.builder_name])
     }
     i=1
     self.connect_signals{ |handler| 
        puts "Signal #{i} : #{handler}"
        i+=1
        method(handler)
      }
  end
  
  
#-----------------------------------------------------------------------------
	#Signaux GTK
#-----------------------------------------------------------------------------
	def pushHypo(objet)	#sauvegarde d'une hypothese
		puts "push Hypo, A faire:"
		puts "empile dans un tableau l'etat de la grille"
		
	end

	def popHypo
		puts "popHypo, A faire:"
		puts "Depiler le tableau d'hypotheze et met a jour la grille"
	end
	
	def sauvegarde
		puts "sauvegarde, A faire:"
		puts "Coté reception du serveur, il faudrait au mieux remplir une base de données"
		dialoog = DialoogBox.new(@sauvegarde,false)
		
	end

	def onDestroy
		puts "OnDestroy, A faire:"	
		puts "Verification que l'utilisateur a une sauvegarde equivalente a la grille actuelle"
		
		#if(@sauvegarde.aJour? == false)
		dialoog = DialoogBox.new(@sauvegarde,true)
		
	end

	
	
#-----------------------------------------------------------------------------

	

end

#Gtk.init
#partie = Partie.new()
#Gtk.main
