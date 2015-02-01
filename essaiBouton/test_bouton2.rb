# encoding: UTF-8


require 'gtk2'
Gtk.init

def onDestroy
	puts "Fin de l'application"
	Gtk.main_quit
end

image1 = Gtk::Image.new("./button-blue.png")
image2 = Gtk::Image.new("./button-red.png")
image2 = Gtk::Image.new("./button-yellow.png")

monApp = Gtk::Window.new

# Titre de la fenêtre
monApp.set_title("test bouton img")
# Taille de la fenêtre
monApp.set_default_size(400,100)
# Réglage de la bordure
monApp.border_width=5
# On ne peut pas redimensionner
monApp.set_resizable(false)
# L'application est toujours centrée
monApp.set_window_position(Gtk::Window::POS_CENTER_ALWAYS)

# Création du Layout
frame=Gtk::VBox.new(true)
monApp.add(frame)

nbClick = 0

boutClick= Gtk::Button.new("     ")
boutClick.set_image(image1)

boutClick.signal_connect('clicked'){
								nbClick=(nbClick+1)%3
								if 	(nbClick==2)
    									boutClick.set_image(image3)
								elsif
									(nbClick==1)
    									boutClick.set_image(image1)
    								else
    									boutClick.set_image(image2)
								end
				    }

frame.add(boutClick)

monApp.show_all
Gtk.main
