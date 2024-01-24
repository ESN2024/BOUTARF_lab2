***Let's count stuff !***

# Introduction
Durant ce deuxième TP, nous serons amenés à intégrer un timer et des afficheurs 7-segments. L'objectif est de mettre en place un compteur qui s'affiche sur les 7-segments, en étant synchronisé toutes les secondes par le timer.

# Architecture du système :

![417591002_720186380213863_5386278482894153472_n](https://github.com/ESN2024/BOUTARF_lab2/assets/121360725/7cf6fc2e-861b-4951-92a5-6d9af959a9f9)


Pour ce deuxième système, il se compose d'un nios 2, une mémoire on-chip, un jtag uart pour le debugage ainsi que quatre pio. On a trois PIO pour les trois afficheurs sept-segments en Output, et un PIO en mode Input pour le Switch, afin de pouvoir faire un reset de comptage.

# Cablage du système :
La figure ci-dessous montre l'architecture du système comprenant les composants décrit dans le schéma ci-dessus. 

![image](https://github.com/ESN2024/BOUTARF_lab2/assets/121360725/08e67d84-204f-4ec0-aded-26ec57d27c30)

# Résultats :
Cette première vidéo montre la première étape, montrant que le comptage sur un écran sept-segment était bien vérifié.

https://github.com/ESN2024/BOUTARF_lab2/assets/121360725/bc5bc70e-14c9-4a79-8853-40afda06f97e

La deuxième vidéo montre l'implémentation d'un compteur à trois digits et son affichage sur l'écran 7 segments.

https://github.com/ESN2024/BOUTARF_lab2/assets/121360725/6d4c70bb-0be3-4596-8b1c-8b1eec342c6a

# Conclusion
À la clôture de cette séance de TP, nous avons acquis une compréhension approfondie de la gestion des interruptions d'un timer. Cette expérience nous a permis de mettre en lumière l'avantage distinctif d'un système SPS sur FPGA, où nous avons constaté que non seulement il offre les fonctionnalités classiques de calcul et de gestion temps-réel d'un ordinateur ou microcontrôleur, mais également la flexibilité d'accéder à des accélérations matérielles modulables, comme illustré dans notre cas avec le décodeur BCD. 
