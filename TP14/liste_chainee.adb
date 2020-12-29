with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body liste_chainee is

   procedure init (liste : out p_liste_chainee) is
   begin
      liste := null;
   end init;

   procedure ajouter_noeud (noeud : in p_liste_chainee; liste : in out p_liste_chainee) is
   begin
      if (liste = null) then
         liste := noeud;
      elsif (liste.all.elmt < noeud.all.elmt) then
            if (liste.all.suiv = null) then
               noeud.all.prec := liste;
               liste.all.suiv := noeud;
            elsif (liste.all.suiv.all.elmt > noeud.all.elmt) then
               noeud.all.prec := liste;
               noeud.all.suiv := liste.all.suiv;
               liste.all.suiv := noeud;
               liste.all.suiv.all.prec := noeud;
               liste := liste.all.suiv;
            else
               liste := liste.all.suiv;
               ajouter_noeud(noeud => noeud,liste => liste);
            end if;
      elsif (liste.all.elmt > noeud.all.elmt) then
            if (liste.all.prec = null) then
               noeud.all.suiv := liste;
               liste.all.prec := noeud;
            elsif (liste.all.prec.all.elmt < noeud.all.elmt) then
               noeud.all.suiv := liste;
               noeud.all.prec := liste.all.prec;
               liste.all.prec := noeud;
               liste.all.prec.all.suiv := noeud;
               liste := liste.all.prec;
            else
               liste := liste.all.prec;
               ajouter_noeud(noeud => noeud, liste => liste);
            end if;
      end if;
   end ajouter_noeud;

   procedure ajouter (elmt : in Integer; liste : in out p_liste_chainee) is
      noeud : p_liste_chainee := new liste_chainee;
   begin
      noeud.all.elmt := elmt;
      ajouter_noeud(noeud => noeud,
                    liste => liste);
   end ajouter;

   procedure supprimer (elmt : in Integer; liste : in out p_liste_chainee) is
   begin
      rechercher (elmt  => elmt,
                  liste => liste);
      if (liste.all.prec /= null) and (liste.all.suiv /= null) then
         liste.all.prec.all.suiv := liste.all.suiv;
         liste.all.suiv.all.prec := liste.all.prec;
      elsif (liste.all.prec = null) and (liste.all.suiv = null) then
         liste := null;
      elsif liste.all.prec = null then
         liste.all.suiv.all.prec := liste.all.prec;
         liste := liste.all.suiv;
      elsif liste.all.suiv = null then
         liste.all.prec.all.suiv := liste.all.suiv;
         liste := liste.all.prec;
      end if;
   exception
         when elmt_existe_pas => Put_Line("l'élément n'existe pas.");

   end supprimer;

   procedure rechercher (elmt : in Integer; liste : in out p_liste_chainee) is
      save : p_liste_chainee := new liste_chainee;
   begin
      if liste.all.elmt = elmt then
         null;
      else
         if liste.all.elmt > elmt then
            while (liste.all.prec /= null) and (liste.all.elmt /= elmt) loop
               liste := liste.all.prec;
            end loop;
            if liste = null then
               liste := save;
               raise elmt_existe_pas;
            end if;
         else
            if liste.all.elmt < elmt then
               while (liste.all.suiv /= null) and (liste.all.elmt /= elmt) loop
                  liste := liste.all.suiv;
               end loop;
               if liste = null then
                  liste := save;
                  raise elmt_existe_pas;
               end if;
            end if;
         end if;
      end if;
   end rechercher;


   procedure affiche (liste : in p_liste_chainee) is
      p : p_liste_chainee := new liste_chainee;
   begin
      p := liste;
      while p.all.prec /= null loop
         p := p.all.prec;
      end loop;

      Put('[');
      while p /= null loop
         Put(p.all.elmt);
         if p.all.suiv /= null then
            Put(',');
         end if;
         p := p.all.suiv;
      end loop;
      Put(']');
      New_Line;
   end affiche;

end liste_chainee;
