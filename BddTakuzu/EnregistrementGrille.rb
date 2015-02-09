require "rubygems"
require "active_record"
load "connectionSQLite3.rb"
load "Grille.rb"

grilles = Grille.create(
 [ {:idGrille  => 1,:niveau => 1,:taille => 36,:grilleDeBase => "00_________1____0___11_______0_0_1__",
    :solution =>"001011010011110100001101110010101100"},
   {:idGrille  => 2,:niveau  => 1,:taille => 36,:grilleDeBase => "__1______1___0_1_0__1___1___0_____00",
    :solution => "001011010101100110011010101001110100"},
   {:idGrille  => 3,:niveau  => 1,:taille => 36,:grilleDeBase => "____1_0_0______11___________0011____",
    :solution => "001011010101100110011001101100110010"},
   {:idGrille  => 4,:niveau  => 1,:taille => 36,:grilleDeBase => "00____0__1_______01_1______00_____0_",
    :solution => "001011010101100110101010011001110100"},
   {:idGrille  => 5,:niveau  => 1,:taille => 36,:grilleDeBase => "_0_________1_0_0________1_____1__11_",
    :solution => "001011010101101010011001110100100110"}
 ]
)
