# PL3-qwerty654321


##Tak&Bin



#Pour lancer le jeu, il faut:
	Sous UNIX:
		-ou se placer dans le fichier et taper "./takuzu"
		-ou placer ce fichier dans le dossier /usr/games,
			et le dossier principal dans "~"
			ainsi il sera accessible de partout avec "takuzu"
	
	Sous Windows:
		se placer dans le dossier menu  et lancer menu.rb


##GIT:
##Installation

* [Pour Windows] , c'est tout nouveau, apparemment c'est intuitif et ça fonctionne bien, je vous laisse découvrir !
* [Pour Mac] , c'est tout nouveau, apparemment c'est intuitif et ça fonctionne bien, je vous laisse découvrir !
* Pour Linux , le paquet _git_ est nécessaire; voir ci-dessous pour découvrir.

Debian et dérivés:
```Bash
sudo apt-get install git
```
Fedora:
```Bash
sudo yum install git
```

[Pour Windows]: http://windows.github.com
[Pour Mac]: http://mac.github.com

###Ajouter le repo et rediriger les push sur le repo commun

```Bash
git remote add upstream https://github.com/Ant-32014/PL3-qwerty654321
git fetch upstream
```

##Utilisation (pour Linux)

En seulement 4 étapes !

1.Mettre à jour le dossier partagé

```Bash
cd "Le chemin vers le dossier cloné"
git pull https://github.com/Ant-32014/PL3-qwerty654321.git
```
**Rep tant que "Travail non finit"**

2.Faire un changement (travail)

3.Commiter le changement, càd mise à jour locale (Dire la mise à jour qu'on a effectué lors de nos dernières actions"
```Bash
git commit -a
```
**Fin rep**

4.Pusher votre travail (Mettre à jour le repo)
```Bash
git push https://github.com/Ant-32014/PL3-qwerty654321.git
```

#Voila !
