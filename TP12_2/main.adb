with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Main is

   type noeud;
   type liste_chainee is access noeud;

   type noeud is record
      val: Integer;
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
   function creer_liste_vide return liste_chainee is
      liste : liste_chainee;
   begin
      liste := new noeud;
      liste := null;
      return liste;
   end creer_liste_vide;

   -- fonction est_vide
   -- sémantique: teste si une liste l est vide
   -- paramètres: l donnée type liste
   -- type retour: booléen
   -- pré-condition: aucune
   -- post-condition: aucune
   -- exception: aucune
   function est_vide (liste: in liste_chainee) return Boolean is
   begin
      if liste = null then
         return True;
      else
         return False;
      end if;
   end est_vide;

   -- procedure inserer_en_tete
   -- sémantique: insère l’élément nouveau en tête de la liste l(l vide ou non vide)
   -- paramètres: liste donnée/résultat type liste
   --             nouveau donnée type entier
   --pré-condition: aucune
   --post-condition: nouveau appartient à la liste
   --exception: aucune
   procedure inserer_en_tete (nouveau: in Integer; liste: in out liste_chainee) is
      elmt_liste: liste_chainee;
   begin
      elmt_liste := new noeud;
      elmt_liste.all.val := nouveau;

      elmt_liste.all.suiv := liste;

      liste := elmt_liste;
   end inserer_en_tete;

   -- procedure afficher_liste
   -- sémantique: afficher les éléments de la liste l
   -- paramètres: l donnée type liste
   -- pré-condition: aucune
   -- post-condition: aucune
   -- exception: aucune
   procedure affiche_liste (liste: in liste_chainee) is
   begin
      if est_vide (liste => liste) then
         Put_Line ("La liste est vide");
      else
         Put (liste.all.val);
         if liste.all.suiv = null then
            New_Line;
         else
            Put (',');
            affiche_liste(liste => liste.all.suiv);
         end if;
      end if;
   end affiche_liste;

   -- fonction rechercher
   -- sémantique: recherche si e est présent dans la liste l,
   -- retourne son adresse ou null si la liste est vide ou si e n’appartient pas à la liste
   -- paramètres: l donnée type liste
   --             e donnée type entier
   -- type-retour: liste
   -- pré-condition: aucune
   -- post-condition: aucune
   -- exception: aucune
   function rechercher (e: in Integer; l: in liste_chainee) return liste_chainee is
      p: liste_chainee := l;
   begin
      -- recherche de l'entier dans la liste
      while not est_vide(liste => p) loop
         if p.all.val = e then
            return p;
         else
            null;
         end if;
         p := p.all.suiv;
      end loop;

      -- Si on sort de la boucle, l'entier n'a pas été trouvé dans la liste
      return null;
   end rechercher;

   -- procedure inserer_apres
   -- sémantique: insère dans la liste l (liste vide ou non vide),
   -- l’élément nouveau, après la valeur data
   -- paramètres: liste donnée/résultat type liste
   --             nouveau donnée type entier
   --             data donnée type entier
   -- pré-condition: aucune
   -- post-condition: nouveau appartient à la liste
   -- exception: data n’est pas dans la, la liste la liste est vide
   procedure inserer_apres (nouveau: in Integer; data: in Integer; liste: in out liste_chainee) is
      elmt_liste_nouveau : liste_chainee := new noeud;
      p : liste_chainee;
   begin
      if est_vide (liste => liste) then -- Si la liste est vide
         raise liste_vide;
      else

         p := rechercher(e => data,
                         l => liste);
         if p = null then -- Si data n'est pas dans la liste
            raise data_pas_dans_la_liste;
         else
            elmt_liste_nouveau.all.val := nouveau;
            elmt_liste_nouveau.all.suiv := p.all.suiv;
            p.all.suiv := elmt_liste_nouveau;
         end if;
      end if;
   end inserer_apres;

   -- procedure inserer_avant
   -- sémantique: insère dans la liste l (liste vide ou non vide),
   -- l’élément de nom nouveau, avant la valeur data
   -- paramètres: liste donnée/résultat type liste
   --             nouveau donnée type entier
   --             data donnée type entier
   -- pré-condition: aucune
   -- post-condition: nouveau appartient à la liste
   -- exception: data n’est pas dans la la liste, la liste est vide
   procedure inserer_avant (data: in Integer; nouveau: in Integer; liste: in out liste_chainee) is
      elmt_liste_nouveau : liste_chainee := new noeud;
      p : liste_chainee:= liste;
   begin
      if est_vide (liste => liste) then -- Si la liste est vide
         raise liste_vide;
      else
         elmt_liste_nouveau.all.val := nouveau;

         if data = liste.all.val then -- si data correspond au début de la chaine
            elmt_liste_nouveau.suiv := liste;
            liste := elmt_liste_nouveau;
         else
            while (not est_vide(p.all.suiv.all.suiv)) and (p.all.suiv.all.val /= data) loop
               p := p.all.suiv;
            end loop;

            -- La valeur peut être dans le dernier maillon de la chaine, il faut d'abord faire les vérifications dans cet ordre
            if p.all.suiv.all.val = data then
               elmt_liste_nouveau.all.suiv := p.all.suiv;
               p.all.suiv := elmt_liste_nouveau;
            else
               if est_vide(p.all.suiv.all.suiv) then
                  raise data_pas_dans_la_liste;
               else
                  null;
               end if;
            end if;
         end if;

      end if;
   end inserer_avant;

   -- procedure enlever
   -- sémantique: enlever un élément e de la liste l (liste vide ou non vide)
   -- paramètres: liste donnée/résultat type liste
   --             e donnée type entier
   -- pré-condition: aucune
   -- post-condition: e n’appartient pas à la liste
   -- exception: aucune
   procedure enlever (e: in Integer; liste: in out liste_chainee) is
      elmt_e_liste : liste_chainee;
      p : liste_chainee := liste;
   begin
      if est_vide(liste => liste) then -- Si la liste est vide, je ne fais rien
         null;
      else
         elmt_e_liste := rechercher(e => e,
                                    l => liste);
         if elmt_e_liste = null then -- Si l'élément e n'est pas dans la liste, je ne fais rien.
            null;
         else
            if liste = elmt_e_liste then -- Si l'élément e de la liste et la tête de la liste pointent sur la même case mémoire
               liste := liste.all.suiv;
            else
               while (not est_vide(p.all.suiv.all.suiv)) and (p.all.suiv.all.val /= e) loop
                  p := p.all.suiv;
               end loop;
               if p.all.suiv.all.val = e then
                  p.all.suiv := p.all.suiv.all.suiv;
               else
                  null;
               end if;
            end if;
         end if;
      end if;
   end enlever;

   p : liste_chainee;

begin
   p := creer_liste_vide;

   inserer_en_tete( nouveau => 1, liste   => p);
   inserer_en_tete( nouveau => 3, liste   => p);
   inserer_en_tete( nouveau => 5, liste   => p);

   affiche_liste(liste => p);

   inserer_avant(data    => 3, nouveau => 4, liste   => p);
   inserer_apres(nouveau => 2, data    => 3, liste   => p);

   affiche_liste(liste => p);

   enlever(e     => 4, liste => p);
   enlever(e     => 3, liste => p);

   affiche_liste(liste => p);
end Main;
