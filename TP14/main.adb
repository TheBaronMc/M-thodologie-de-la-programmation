with liste_chainee; use liste_chainee;

procedure Main is
   liste : p_liste_chainee;
begin

   -- initialisation de la chaine
   init (liste => liste);

   -- ajout d'éléments
   ajouter (elmt  => 5,
            liste => liste);
   ajouter (elmt  => 4,
            liste => liste);
   ajouter (elmt  => 8,
            liste => liste);
   ajouter (elmt  => 1,
            liste => liste);

   -- affichage
   affiche (liste => liste);

   -- supprimer
   supprimer (elmt  => 4,
              liste => liste);
   supprimer (elmt  => 8,
              liste => liste);

    -- affichage
   affiche (liste => liste);



end Main;
