
require 'gtk2'

def change_img(widget)
    image2 = Gtk::Image.new("button-red.png")
    widget.image = image2
end

image1 = Gtk::Image.new("button-blue.png")

button0 = Gtk::Button.new("0")
button0.image = image1

#Attach signals
button0.signal_connect( "clicked" ) do |w|
    change_img(w)
end

box1 = Gtk::VBox.new(false, 0)
box1.pack_start(button0, false, false, 0)

window = Gtk::Window.new("Button Images")
window.set_default_size(200,200)

window.signal_connect("delete_event") {
  false
}

window.signal_connect("destroy") {
  puts "destroy event occured"
  Gtk.main_quit
}

window.add(box1)
window.show_all
Gtk.main
