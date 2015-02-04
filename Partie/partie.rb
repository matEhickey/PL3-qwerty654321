# encoding: UTF-8

##
# Auteur Groupe 2

require 'gtk2'
require './../socket/Sauvegarde.rb'
require './../Dialog_sauvegarde/dialoogBox.rb'
require './../Partie/cellule.rb'
require './../timer/Timer.rb'




class Partie < Gtk::Builder
	@sauvegarde
	@taille
	@grille
	@fichier	#pas vraiment un fichier, une chaine de charactere en fait
	@grilleInit	#grille de depart
	@fenetreUser
	@timer
	@pause	#boolean indiquant l'etat du jeu
	@score 
	
  def initialize(taille,grille,fenetreUser)	#grille en chaine de caract
    super()
    @taille = taille
    @fenetreUser = fenetreUser
    @fenetreUser.hide
    @pause = false
    @score = @taille*@taille
    
    self.add_from_file(__FILE__.sub(".rb",".glade"))
    
    self['window1'].set_window_position Gtk::Window::POS_CENTER
    self['window1'].signal_connect('destroy') { 
    	@window1.hide
    	@fenetreUser.show
     }
     
    #self['window1'].show_all
    
    # Creation d'une variable d'instance par composant glade
    i=1
    self.objects.each() { |p|
    	#puts "Instance #{i} : #{p}"
    	i+=1
        instance_variable_set("@#{p.builder_name}".intern, self[p.builder_name])
     }
     @pausePlay_button.set_label "  Pause  "
     i=1
     self.connect_signals{ |handler| 
       # puts "Signal #{i} : #{handler}"
        i+=1
        method(handler)
      }
     
	@table1.n_rows=@table1.n_columns = @taille
	#puts "Nombre de lignes : #{@table1.n_rows}"
	#puts "Nombre de collones : #{@table1.n_columns}"
	
	@grille = Array.new
	
	0.upto(@taille-1){ |i|
		ligne = Array.new
		0.upto(@taille-1){|j|
			#if fichier.readBytes == '_'
				cellule = Cellule.creer(false,0)
			#else
				#cellule = Cellule.creer(true,0).show
			#end
			cellule.signal_connect('clicked'){cellule.onClic(cellule)}
			@table1.attach_defaults(cellule,i,i+1,j,j+1)
			ligne.push cellule
			
		}
		@grille.push ligne
		
		
	}
	
	@timer = Timer.new @pausePlay_button
	@threadTime = Thread.new{
		while(true)
			begin
				@temps.set_label @timer.to_s
			rescue
				@temps.set_label "BUG"
				p1.exit
			end
			sleep 0.03
			
		end
	}
	
	@window1.show_all
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
	
	def razGrille
		
		puts "appui sur raz"
		i = 0
		j = 0
		
		@grille.each{ |ligne|
				ligne.each{ |cellule|
					
					#cellule.destroy
					#if fichier.readBytes == '_'
					
						#@table1.remove(cellule)
						
						cellule.raz
						#@table1.attach_defaults(cellule,i,i+1,j,j+1)
						
					
					#	cellule = Cellule.creer(false,0).show
					#else
						#cellule = Cellule.creer(true,0).show
					#end
					#cellule.signal_connect('clicked'){cellule.onClic(cellule)}
					#@table1.attach_defaults(cellule,i,i+1,j,j+1)
					
					i+=1
				}
				j+=1
				
		}
		@timer.raz
		
	end
	
	def pause
		if(@pause == false)
			@timer.pause
			@pause = true
			
		else 
			@timer.reprendre
			@pause = false
			
		end
		
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
		if(@pause == false)
			pause
		end
		@sauvegarde = Sauvegarde.new("Mat",1,@score,@timer.to_s,true)
		puts @sauvegarde
		dialoog = DialoogBox.new(@sauvegarde,true,@fenetreUser,@window1,@threadTime)
		
		
	end

	
	
#-----------------------------------------------------------------------------

	

end

#Gtk.init
#partie = Partie.new()
#Gtk.main
