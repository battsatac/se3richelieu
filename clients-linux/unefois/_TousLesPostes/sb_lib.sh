
#!/bin/sh

##########################################################################
# Fonctions de mise à jour
# Source : S Batt 
##########################################################################

TEST_APT="/var/lib/apt/lists/lock"
TEST_DPKG="/var/lib/dpkg/lock"
ATTENTE_MAX=$(( 10 * 60 ))   # temps d'attente maximal en secondes, soit 10 minutes

#ATTENTE_MAX=$(( 10 ))      # temps d'attente maximal en secondes, soit 5 minutes
#INTERVALLE_TEST=5          # temps d'attente maximal en secondes

function attend_verrou ()
{
    # La fonction prend en argument : 
    # 1 : le nom du fichier à tester
    # 2 : optionnel : le temps maximal d'attente en SECONDES
    # 3 : optionnel : l'intervalle de temps en SECONDES entre les tests

    # Traitement des arguments :

    if [ -z "$1" ]
        then
            echo "Fichier verrou non fourni. Abandon"
            exit 1
    fi
    declare NOM_FICHIER="$1"
    declare -i TEMPS_MAX=${2:-60}       # temps d'attente maximal en secondes (par défaut on attend 1 minute)
    declare -i INTERVALLE=${3:-5}       # Intervalle de test, par défaut toutes les 5 secondes si non fourni

    # Début du programme
    declare -i compteur=0

    while fuser "$1" >/dev/null 2>&1 ; do
        #   while true ; do
        # inspiré de https://askubuntu.com/questions/132059/how-to-make-a-package-manager-wait-if-another-instance-of-apt-is-running
        echo "$(date) : En attente du deverrouillage de $1"
        sleep ${INTERVALLE}
        ((compteur > TEMPS_MAX)) && return 1
        ((compteur+=INTERVALLE))
    done
    return 0
}






##########################################################################
# Fonctions de logging
# Source : 
# http://www.cubicrace.com/2016/03/efficient-logging-mechnism-in-shell.html
##########################################################################
# Exemple d'utilisation : 
# #!/bin/sh
# 
# source ./logger.sh
# SCRIPTENTRY
# updateUserDetails(){
#     ENTRY
#     DEBUG "Username: $1, Key: $2"
#     INFO "User details updated for $1"
#     EXIT
# }
# 
# INFO "Updating user details..."
# updateUserDetails "cubicrace" "3445"
# 
# rc=2
# 
# if [ ! "$rc" = "0" ]
# then
#     ERROR "Failed to update user details. RC=$rc"
# fi
# SCRIPTEXIT



SCRIPT_LOG=/home/cubicrace/SystemOut.log
touch $SCRIPT_LOG

function SCRIPTENTRY(){
 timeAndDate=`date`
 script_name=`basename "$0"`
 script_name="${script_name%.*}"
 echo "[$timeAndDate] [DEBUG]  > $script_name $FUNCNAME" >> $SCRIPT_LOG
}

function SCRIPTEXIT(){
 script_name=`basename "$0"`
 script_name="${script_name%.*}"
 echo "[$timeAndDate] [DEBUG]  < $script_name $FUNCNAME" >> $SCRIPT_LOG
}

function ENTRY(){
 local cfn="${FUNCNAME[1]}"
 timeAndDate=`date`
 echo "[$timeAndDate] [DEBUG]  > $cfn $FUNCNAME" >> $SCRIPT_LOG
}

function EXIT(){
 local cfn="${FUNCNAME[1]}"
 timeAndDate=`date`
 echo "[$timeAndDate] [DEBUG]  < $cfn $FUNCNAME" >> $SCRIPT_LOG
}


function INFO(){
 local function_name="${FUNCNAME[1]}"
    local msg="$1"
    timeAndDate=`date`
    echo "[$timeAndDate] [INFO]  $msg" >> $SCRIPT_LOG
}


function DEBUG(){
 local function_name="${FUNCNAME[1]}"
    local msg="$1"
    timeAndDate=`date`
 echo "[$timeAndDate] [DEBUG]  $msg" >> $SCRIPT_LOG
}

function ERROR(){
 local function_name="${FUNCNAME[1]}"
    local msg="$1"
    timeAndDate=`date`
    echo "[$timeAndDate] [ERROR]  $msg" >> $SCRIPT_LOG
}
