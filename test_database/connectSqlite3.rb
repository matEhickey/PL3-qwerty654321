require 'active_record'
require 'sqlite3'

ActiveRecord::Base.etablish_connection(
	:adapter =>"sqlite3",
	:database => "maBase.sqlite3",
	:timeout => 5000
)
