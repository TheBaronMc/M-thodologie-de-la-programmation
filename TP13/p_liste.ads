generic
   type T_Element is private;
package p_liste is

   type noeud;
   type liste_chainee is access noeud;

   type noeud is record
      val: T_Element;
      suiv: liste_chainee;
   end record;

   liste_vide: exception;
   data_pas_dans_la_liste: exception;

   -- fonction créer_liste_vide
   -- sémantique: créer une liste vide
   -- paramètres: aucun
   -- type-retour: liste
   -- pré-condition: aucune
   -- post-condition: est_vide (l) vaut vrai
   -- exception: aucune
   function creer_liste_vide return liste_chainee;

   -- fonction est_vide
   -- sémantique: teste si une liste l est vide
   -- paramètres: l donnée type liste
   -- type retour: booléen
   -- pré-condition: aucune
   -- post-condition: aucune
   -- exception: aucune
   function est_vide (liste: in liste_chainee) return Boolean;

   -- procedure inserer_en_tete
   -- sémantique: insère l’élément nouveau en tête de la liste l(l vide ou non vide)
   -- paramètres: liste donnée/résultat type liste
   --             nouveau donnée type entier
   --pré-condition: aucune
   --post-condition: nouveau appartient à la liste
   --exception: aucune
   procedure inserer_en_tete (nouveau: in T_Element; liste: in out liste_chainee);

   -- procedure afficher_liste
   -- sémantique: afficher les éléments de la liste l
   -- paramètres: l donnée type liste
   -- pré-condition: aucune
   -- post-condition: aucune
   -- exception: aucune
   --procedure affiche_liste (liste: in liste_chainee);

   -- fonction rechercher
   -- sémantique: recherche si e est présent dans la liste l,
   -- retourne son adresse ou null si la liste est vide ou si e n’appartient pas à la liste
   -- paramètres: l donnée type liste
   --             e donnée type entier
   -- type-retour: liste
   -- pré-condition: aucune
   -- post-condition: aucune
   -- exception: aucune
   --function rechercher (e: in T_Element; l: in liste_chainee) return liste_chainee;

   -- procedure inserer_apres
   -- sémantique: insère dans la liste l (liste vide ou non vide),
   -- l’élément nouveau, après la valeur data
   -- paramètres: liste donnée/résultat type liste
   --             nouveau donnée type entier
   --             data donnée type entier
   -- pré-condition: aucune
   -- post-condition: nouveau appartient à la liste
   -- exception: data n’est pas dans la, la liste la liste est vide
   procedure inserer_apres (nouveau: in T_Element; data: in T_Element; liste: in out liste_chainee);

   -- procedure inserer_avant
   -- sémantique: insère dans la liste l (liste vide ou non vide),
   -- l’élément de nom nouveau, avant la valeur data
   -- paramètres: liste donnée/résultat type liste
   --             nouveau donnée type entier
   --             data donnée type entier
   -- pré-condition: aucune
   -- post-condition: nouveau appartient à la liste
   -- exception: data n’est pas dans la la liste, la liste est vide
   procedure inserer_avant (data: in T_Element; nouveau: in T_Element; liste: in out liste_chainee);

   -- procedure enlever
   -- sémantique: enlever un élément e de la liste l (liste vide ou non vide)
   -- paramètres: liste donnée/résultat type liste
   --             e donnée type entier
   -- pré-condition: aucune
   -- post-condition: e n’appartient pas à la liste
   -- exception: aucune
   procedure enlever (e: in T_Element; liste: in out liste_chainee);

end p_liste;
