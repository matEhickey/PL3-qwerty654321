# Ruby SQLite : creationBddSQLite.rb  
require 'sqlite3' # installation par  : gem install sqlite3
	
begin	

	# la création de cet objet, permet d'ouvrir dans le répertoire courant "takuzu.db" 
	# ou en cas d'absence, la base est crée directement.
	nomBdd = "takuzu.sqlite3"
	
	if File.file?(nomBdd)
		maBase = SQLite3::Database.open(nomBdd)
		
	else
		maBase = SQLite3::Database.new(nomBdd)		
		
		## Creation des differentes tables
		#- Table : questions
		maBase.execute( \
		"CREATE TABLE questions ( \
					idQuestion INTEGER PRIMARY KEY, \
					question TEXT);" )
		#- Table : grilles
		maBase.execute( \
		"CREATE TABLE grilles ( \
					idGrille INTEGER PRIMARY KEY, \
					niveau INTEGER, \
					taille INTEGER, \
					grilleDeBase TEXT, \
					solution TEXT);" )
	
		#- Table : joueurs
		maBase.execute( \
		"CREATE TABLE joueurs ( \
					idJoueur INTEGER PRIMARY KEY, \
					pseudo TEXT, \
					motDePasse TEXT, \
					email TEXT, \
					avatar TEXT, \
					idQuestion INTEGER NOT NULL CONSTRAINT fk_questions_contenu REFERENCES questions (idQuestion), \
					reponse TEXT, \
					niveau INTEGER);" )
		#- Table : scores
		maBase.execute( \
		"CREATE TABLE scores ( \
					idScore INTEGER PRIMARY KEY, \
					score INTEGER, \
					niveauScore TEXT, \
					tempsEffectue NUMERIC, \
					idJoueur INTEGER NOT NULL CONSTRAINT fk_joueurs_contenu REFERENCES joueurs (idJoueur), \
					idGrille INTEGER NOT NULL CONSTRAINT fk_grilles_contenu REFERENCES grilles (idGrille));" )
		#- Table : parties
		maBase.execute( \
		"CREATE TABLE parties ( \
					idPartie INTEGER PRIMARY KEY, \
					enregistrerPartie TEXT, \
					idJoueur INTEGER NOT NULL CONSTRAINT fk_joueurs_contenu REFERENCES joueurs (idJoueur), \
					idGrille INTEGER NOT NULL CONSTRAINT fk_grilles_contenu REFERENCES grilles (idGrille));" )
	
	
	
	
	
		## Remplissage des tables "questions" et "grilles" par ses valeurs par defaut
		# - Table : questions
		maBase.execute("INSERT INTO questions (idQuestion,question) VALUES (1, 'Mon premier jeu')")
		maBase.execute("INSERT INTO questions (idQuestion,question) VALUES (2, 'Ma date de naissance')")
		maBase.execute("INSERT INTO questions (idQuestion,question) VALUES (3, 'Mon jeu favoris')")
		maBase.execute("INSERT INTO questions (idQuestion,question) VALUES (4, 'Autre')")
			
	end
end	
	
