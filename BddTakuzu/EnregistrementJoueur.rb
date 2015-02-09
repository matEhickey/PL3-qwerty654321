require "rubygems"
require "active_record"
load "connectionSQLite3.rb"
load "Joueur.rb"

unJoueur = Joueur.create(
 :idJoueur	=> 0,
 :pseudo	=> "bob",
 :motDePasse	=> "alibaba40",
 :email		=> "bob@gmail.com",
 :avatar	=> "",
 :idQuestion	=> 4,
 :reponse	=> "caserne",
 :niveau	=> 1)
