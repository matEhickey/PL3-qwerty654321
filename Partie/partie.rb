# encoding: UTF-8

##
# Auteur Groupe 2

require 'gtk2'
require './../socket/Sauvegarde.rb'
require './../Dialog_sauvegarde/dialoogBox.rb'
require './../Partie/cellule.rb'




class Partie < Gtk::Builder
	@sauvegarde
	@taille
	@grille
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
    	#puts "Instance #{i} : #{p}"
    	i+=1
        instance_variable_set("@#{p.builder_name}".intern, self[p.builder_name])
     }
     i=1
     self.connect_signals{ |handler| 
       # puts "Signal #{i} : #{handler}"
        i+=1
        method(handler)
      }
      @taille = 10
	@table1.n_rows=@table1.n_columns = @taille
	#puts "Nombre de lignes : #{@table1.n_rows}"
	#puts "Nombre de collones : #{@table1.n_columns}"
	
	@grille = Array.new
	0.upto(@taille-1){ |i|
		ligne = Array.new
		0.upto(@taille-1){|j|
			cellule = Cellule.creer(1,0).show
			cellule.signal_connect('clicked'){cellule.onClic}
			#cellule.label = "     "
			#cellule.signal_connect('clicked'){
				#puts "appui sur bouton [#{i}:#{j}]"
			#	if(cellule.label == "     ")
			#		cellule.label = " 1 "
			#	elsif(cellule.label == " 1 ")
			#		cellule.label = " 0 "
			#	else
			#		cellule.label = "     "
			#	end
			#}
			@table1.attach_defaults(cellule,i,i+1,j,j+1)
			ligne.push cellule
		}
		@grille.push ligne
		
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
