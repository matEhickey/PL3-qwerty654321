# encoding: UTF-8

##
# Auteur MATHIAS DIDIER

require 'gtk2'
require '../Partie/partie.rb'
require '../image_user/selecteurDimage.rb'
require '../User/user.rb'

class UserInterface < Gtk::Builder
	
	@fenetreMenu
	@user
	@gagnantDefiDay	# a remplacer par un objet DefiDay, et recuperer les infos
	
  def initialize (fenetreMenu,user,defiday)
    super()
    @user = user
    @gagnantDefiDay = defiday
    @fenetreMenu = fenetreMenu
    @fenetreMenu.hide
    self.add_from_file(__FILE__.sub(".rb",".glade"))
    
    self['window1'].set_window_position Gtk::Window::POS_CENTER
    self['window1'].signal_connect('destroy') { 
    		@window1.hide
    		@fenetreMenu.show
    }
    
    
    # Creation d'une variable d'instance par composant glade
    self.objects.each() { |p|
    	#p p
        instance_variable_set("@#{p.builder_name}".intern, self[p.builder_name])
     }
     
     
    # chargement image compte user
	#puts @user.image
	@boiteImageUser.add @user.image
	#puts @boiteImageUser
	
	#affichage de son nom
	@boutonNom.label = @user.nom
	@boutonNom.signal_connect('clicked'){user.display}
	
	#de son level
	@levelUser.label = "Parties jouées:\n\t #{@user.level}"
	
	
	#----------DefiDay
	
	@nom_defiDay.set_label @gagnantDefiDay.nom
	@nom_defiDay.signal_connect('clicked') {
		Thread.new{
			@gagnantDefiDay.display
		}
	}
	
	
	
	
	
	
     self.connect_signals{ |handler| 
        #puts handler
        method(handler)
      }
      self['window1'].show_all
  end


def jouerPartie(bouton)
	case(bouton)
		
		when @partie6
			taille = 6
			grille = "00_________1____0___11_______0_0_1__"
			grilleSoluce = "001011010011110100001101110010101100"
		when @partie8
			taille = 8
			grille = "00___0____0_0____1_1__101_______0____1____11_1___1________0_0___"
			grilleSoluce ="0010101101010101110100101010101001001101101101000110101010010101"
		when @partie10	
			taille = 10
			grille = "_____________11__0_____1_00_1_0_________0________________1__1_____11_1___0__1___1__00__0___________0"
			grilleSoluce = "0010011011010110100110011001100110010101010110101010101101001001001101011010101010100100111101010100"
		when @partie12
			taille = 12
			grille = "0____0_0____0_0__0____00__1________001_0___0_1__0_0_0____1______0__1__1__1_1__0__1___1__________1__00______1__0__1__0_01_1_0____0_____1______1__"
			grilleSoluce = "001010101011010110110100101101010010010010101101010101101100101001010011110110010100010110101010101001001011100101010101011010110010101001001101"
	end
	Partie.new(taille,grille,grilleSoluce,@window1,@user)
	
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
				#begin
				filename = pipeReader.gets.delete!("\n")
				puts "recu #{filename}"			
				@imageUser.set Gdk::Pixbuf.new(filename,180,300)
				
				#@window1.show_all
				#rescue
				#	puts "------Not working------"
				#end
		}
		
		
	end

end


