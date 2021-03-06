# encoding: UTF-8

##
# auteur :Groupe 2

require 'gtk2'
require './../User/userInterface.rb'
require './../User/user.rb'


class Menu < Gtk::Builder

	@grilles	#tableau avec pour chaque case 
	
  def initialize 
    super()
    self.add_from_file(__FILE__.sub(".rb",".glade"))
    
    self['window1'].set_window_position Gtk::Window::POS_CENTER
    self['window1'].signal_connect('destroy') { Gtk.main_quit }
    self['window1'].set_title "Tak&Bin"
    self['window1'].set_default_size(500,300)
    self['window1'].show_all
    
    
    # Creation d'une variable d'instance par composant glade
    puts "Objets instanciés:"
    self.objects.each() { |p|
    	puts "\t#{p}"
        instance_variable_set("@#{p.builder_name}".intern, self[p.builder_name])
     }
    puts "\nSignaux connectés:"
     self.connect_signals{ |handler| 
        puts "\t#{handler}"
        method(handler)
      }
      
     # demande au serveur le fichier des parties
     
      
      
  end
  
  
  
  #-------------------------------------------------------



	def nouvPartie() 
		puts "nouvPartie, A faire :"
		puts "creation d'une dialogBox pour demander au joueur le niveau, et la taille de la grille"
		puts "creation grille, et initialisation avec fichier:"
		#parcourir fich jusqu'a trouver niveau = choix, puis jusqu'a taille = choix, compter nombre de grille correspondant au choix, puis rand
	
		puts "appel a partie.rb avec la grille initialisee comme argument"
	
		#TODO cree le menu de selection de la grille, qui lui , appel la nouvelle partie
		user = User.creerDefault("Mathias","fafzefz@xafezf.fr","ddsfsdgsdg")
		defiday = User.creer("Bob","ytjfyytfj@tfthttf.fr","jygjyyjg","./../Images/bob.png")#remplacer par un objet defiday, que le serveur aura envoyer
		partie = UserInterface.new(@window1,user,defiday)
	
			
	end

	

	def showHigh()
		puts "showHigh, A faire:"
		puts "-creation d'un dialogue box ou d'une nouvelle fenetre?"
		puts "\t Dans highscore.rb"
		puts "\t cherchcer existence du fichier de sauvegarde"
		puts "\t si present :"
		puts "\t en faire un affichage en liste trié par niveau, par score ou temps"
		puts "\t et faire fonction permettant d'y inscrire un nouveau score"
	
	end

	def onDestroy()
		puts "onDestroy, a faire:"
		#puts "fermeture de toutes les fenetres filles lancées"
		Gtk.main_quit
	end



end

Gtk.init
menu = Menu.new()
Gtk.main
