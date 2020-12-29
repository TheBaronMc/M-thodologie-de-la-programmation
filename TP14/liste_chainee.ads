package liste_chainee is

   type liste_chainee is private;
   type p_liste_chainee is access liste_chainee;

   elmt_existe_pas : exception;

   procedure init (liste : out p_liste_chainee);

   procedure ajouter (elmt : in Integer; liste : in out p_liste_chainee);

   procedure supprimer (elmt : in Integer; liste : in out p_liste_chainee);

   procedure rechercher (elmt : in Integer; liste : in out p_liste_chainee);

   procedure affiche (liste : in p_liste_chainee);


private
   type liste_chainee is record
      prec : p_liste_chainee;
      elmt : Integer;
      suiv : p_liste_chainee;
   end record;

end liste_chainee;
