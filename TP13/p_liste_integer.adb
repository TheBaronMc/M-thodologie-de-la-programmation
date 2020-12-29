with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body p_liste_integer is

   procedure affiche_liste (liste: in liste_chainee) is
   begin
      if liste = null then
         null;
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


end p_liste_integer;
