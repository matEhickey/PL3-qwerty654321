require 'rubygems'
require 'active_record'
#require 'sqlite3'

#require './connectSqlite3.rb'

class User < ActiveRecord::Base
@id
@name
@status
#validates_presence_of :name


end

a = User.new
a.id = 1
a.name = "John"
a.status = "love brains"
a.save

puts User
