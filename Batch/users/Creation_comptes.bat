:: Crée un nouveau compte utilisateur pour Jean avec des paramètres spécifiques

rem Oleksandr Dziuba 

net user Jean 123456 /add /active:Yes /comment:"Compte Admin" /expires:Never /fullname:"Jean Pascal" /passwordchg:Yes
pause  :: Met en pause l'exécution du script pour visualiser les résultats de la commande précédente

:: Crée un nouveau compte utilisateur pour Sylvain avec des paramètres spécifiques
net user Sylvain q1w2e3 /add /active:No /comment:"Compte Utilisateur" /expires:Never /fullname:"Sylvain Cossette" /passwordchg:No

:: Crée un nouveau compte utilisateur pour Andree avec des paramètres spécifiques
net user Andree 567890 /add /active:Yes /comment:"invite" /expires:2017-04-21 /fullname:"Andree Watters" /passwordchg:No

:: Crée un nouveau compte utilisateur pour Yuri avec des paramètres spécifiques
net user Yuri w2e3r4 /add /active:Yes /comment:"Compte stagiaire" /expires:2017-05-01 /fullname:"Yuri Gagarine" /passwordchg:No

:: Crée un nouveau compte utilisateur pour Pierre avec des paramètres spécifiques
net user Pierre Allos /add /active:No /comment:"Compte Directeur" /expires:Never /fullname:"Pierre Lambert" /passwordchg:Yes

:: Crée un nouveau compte utilisateur pour Samuel avec des paramètres spécifiques
net user Samuel plaine /add /active:Yes /comment:"Compte Consultant" /expires:2017-06-01 /fullname:"Samuel de Champlain" /passwordchg:No
pause  :: Met en pause l'exécution du script pour permettre la vérification des comptes créés


:: Explications des options utilisées pour la commande `net user`
:: /add : Ajoute un utilisateur au système.
:: /active:Yes|No : Active ou désactive le compte de l'utilisateur.
:: /comment:"text" : Ajoute un commentaire descriptif au compte de l'utilisateur.
:: /expires:date|Never : Définit une date d'expiration pour le compte ou le rend permanent.
:: /fullname:"name" : Spécifie le nom complet de l'utilisateur.
:: /passwordchg:Yes|No : Autorise ou interdit à l'utilisateur de changer son mot de passe.

