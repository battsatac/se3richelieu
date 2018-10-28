# se3richelieu
Ensemble des scripts persos utilisés sur le serveur se3 du lycée Richelieu (linux uniquement pour l'instant)


## Installation et configuration de git

Installer git :
```
apt-get install git -y
```

Faire en sorte que git ne tienne pas compte des changements de droits sur les fichiers
```
git config core.fileMode false
```
Cela évite d'avoir à faire des commit à chaque dpkg-reconfigure
Gérer aussi de près le fichier .gitignore pour, par exemple, ne pas suivre `bin/logon`.


Installer la clef ssh pour git dans /root/.ssh :


## Clonage du projet et mise en place du montage

Clonage du projet :
```
mkdir -p /root/batts/github
cd /root/batts/github
git clone git@github.com:battsatac/se3richelieu.git
```

Ensuite lancer `./montage_bind.sh` qui se trouve à la racine du projet.


## Rafinnements

De façon optionnelle pour changer l'éditeur par défaut pour vim (au lieu de nano) :
```
sudo update-alternatives --config editor
```
