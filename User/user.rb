require '../theme/theme.rb'
require 'gtk2'

class User
	@@nombre = 0
	@id	#cle bdd
	
	@nom	
	@mail
	@password	
	@parties
	@theme
	@level
	@experience
	@image
	
	attr_reader :nom
	attr_reader :id
	attr_reader :level
	attr_accessor :image
	
	def initialize(nom,mail,password)
		@nom,@mail,@password= nom,mail,password
		@parties = Array.new
		@level = 1
		@experience = 0
		@theme = Theme.new(0)
		@@nombre+=1
		@id = @@nombre
		@image = Gtk::Image.new("../Images/patrick.png")
		puts "Creation joueur #{@@nombre}"
		self
	end
	
	def User.creerDefault(nom,mail,password)
		new(nom,mail,password)
		
	end
	def User.creer(nom,mail,password,imagefile)
		nouveau = creerDefault(nom,mail,password)
		nouveau.image = Gtk::Image.new(imagefile)
		return nouveau
	end
	
	
	
	
	def to_s
		return "#{@id}:#{@nom}, level #{@level}, experience #{@experience}"
	end
	
	def display
		
		
		
		
		
		window = Gtk::Window.new(@nom)
		#window.signal_connect('destroy'){}
		window.set_default_size(300,100)

		vb = Gtk::VBox.new
		vb.add(Gtk::Label.new("#{@nom}"))
		vb.add(Gtk::Label.new("Joueur :#{@id}"))
		vb.add(Gtk::Label.new("Niveau :#{@level}"))
		frame = Gtk::Frame.new
		
		
		#-------TODO------------- Trouver comment dupliquer une image car ceci ne fonctionne pas:
		#copieImage = Gtk::Image.new(@image.file_name)
		#frame.add(@image) 
		 
			#message d'erreur:
				#Attempting to add a widget with type GtkImage to a container 
				#of type GtkFrame, but the widget is already inside
				# a container of type GtkAspectFrame,
		
		
		vb.add frame
		boutonFermer = Gtk::Button.new("Fermer")
		boutonFermer.signal_connect('clicked'){window.destroy}
		vb.add(boutonFermer)
		window.add vb
		window.show_all
		
		
		
	end
end

#User.test
