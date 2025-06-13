#############################################################
#                                                           #
#                      Exercice application                 #
#                                                           #
#############################################################

# Objectif : pratiquez en autonomie les notions apprises dans le module 1.
# Lisez bien les instructions
# Auteur : N.Ibrahimi
# Date : 10/06/2025



# Initialisation ----------------------------------------------------------


## Installation ------------------------------------------------------------


# Vérifier si le package questionr est installé ?
# Si le package n'est pas installé, réalisez son installation.
# indiquez moi en commentaire les 2 méthodes possibles.

install.packages("questionr")

# charger le package questionr à l'aide de la fonction library()
library(questionr)

# indiquez moi ci dessous en commentaire l'autre méthode possible

# dans le package questionr, il existe une table de données correspondant
# à un extrait de l’enquête Histoire de vie réalisée par l’INSEE en 2003.
# Il contient 2000 individus et 20 variables.
# Exécuter la ligne de code si dessous.

data(hdv2003)

# qu'observez vous dans l'environnement ?
# Brièvement décrivez moi la table ?
# nombre de ligne/colonnes à l'aide des fonctions nrow(), ncol() ou dim()
# listez moi les noms des colonnes à l'aide de la fonction colnames()

# Quel est le type d'objet de hdv2003 ? pour cela exécuter la ligne de code suivante
class(hdv2003)

# Si on demande d’afficher l’objet hdv2003 dans la console, que devez-vous faire ?

# R va afficher l’ensemble du contenu de hdv2003 à l’écran ce qui,
# sur un tableau de cette taille, ne sera pas très lisible.
# Pour une exploration visuelle, le plus simple est souvent d’utiliser
# la visionneuse intégrée à RStudio et qu’on peut appeler avec la fonction View().

# Quel est le type de la variable sexe ?
# pour cela plusieurs méthodes sont possibles pour y répondre.
# Soit à l'aide de l'interface RStudio (environnement ou View())
# Soit par ligne de code en sélectionnant la variable et en appelant la fonction class()

# Combien d'observations y -a -t il en filtrant seulement les individus de sexe féminin ?
# aide, à l'aide de View et de l'outil Filter (clique/bouton)

# à l'aide de la fonction mean(), calculez moi la moyenne du poids.

# à l'aide de la fonction table(), donnez moi les effectifs des catégories de la variable qualif

# que constatez vous ? N' y a -t-il pas de l'information manquante ?

# Veuillez lire la documentation de la fonction table() ?
# indiquez 3 manières (et même un 4ème qui est un raccourci) d'avoir de l'aide ?
# argument useNA est par défaut "no", à vous de modifier la valeur afin
# que les données manquantes s'affichent également




