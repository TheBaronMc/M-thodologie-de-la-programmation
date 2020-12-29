package P_pile is

   type T_pile is private;
   type pointeur_T_pile is access T_pile;

   pile_est_vide : exception;

   procedure init (pile : out pointeur_T_pile);

   procedure empile (elmt : in Integer; pile : out pointeur_T_pile);

   procedure depile (pile : in out pointeur_T_pile);

   function sommet (pile : in pointeur_T_pile) return Integer;

   function est_vide (pile : in pointeur_T_pile) return Boolean;

private

   type T_pile is record
      val : Integer;
      prec : pointeur_T_pile;
   end record;

end P_pile;
