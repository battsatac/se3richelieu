# se3richelieu
Ensemble des scripts persos utilisés sur le serveur se3 du lycée Richelieu (linux uniquement pour l'instant)


## Installation et configuration de git

### Installer git :
```
apt-get install git -y
```
### Installer la clef ssh pour git 
À faire à la main dans /root/.ssh

### Faire en sorte que git ne tienne pas compte des changements de droits sur les fichiers
```
git config core.fileMode false
```
Cela évite d'avoir à faire des commit à chaque dpkg-reconfigure
Gérer aussi de près le fichier .gitignore pour, par exemple, ne pas suivre `bin/logon`.

Pour ne plus suivre un fichier qui aurait été ajouté avant la déclaration dans .gitignore : 
> Another useful thing you may want to do is to keep the file in your working tree but remove it from your staging area. In other words, you may want to keep the file on your hard drive but not have Git track it anymore. This is particularly useful if you forgot to add something to your .gitignore file and accidentally staged it, like a large log file or a bunch of .a compiled files. To do this, use the --cached option:

> $ git rm --cached README


## Clonage du projet et mise en place du montage

Clonage du projet :
```
mkdir -p /root/batts/github
cd /root/batts/github
git clone git@github.com:battsatac/se3richelieu.git
```

Ensuite lancer `./montage_bind.sh` qui se trouve à la racine du projet.


## Raffinements

De façon optionnelle pour changer l'éditeur par défaut pour vim (au lieu de nano) :
```
sudo update-alternatives --config editor
```
