require 'rubygems'
require 'active_record'
require 'sqlite3'
require 'Contact.rb'
require 'connectSqlite3'

a = Zombie.new
a.id = 1
a.name = "John"
a.status = "love brains"
a.save
