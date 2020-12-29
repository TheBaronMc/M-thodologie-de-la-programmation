package body p_pile is

   procedure init (pile : out pointeur_T_pile) is
   begin
      pile := null;
   end init;

   procedure empile (elmt : in Integer; pile : out pointeur_T_pile) is
      noeud : pointeur_T_pile := new T_pile;
   begin
      noeud.all.val := elmt;
      noeud.all.prec := pile;
      pile := noeud;
   end empile;

   procedure depile (pile : in out pointeur_T_pile) is
   begin
      if not est_vide (pile => pile) then
         pile := pile.all.prec;
      else
         raise pile_est_vide;
      end if;
   end depile;

   function sommet (pile : in pointeur_T_pile) return Integer is
   begin
      if not est_vide (pile => pile) then
         return pile.all.val;
      else
         raise pile_est_vide;
      end if;
   end sommet;

   function est_vide (pile : in pointeur_T_pile) return Boolean is
   begin
      if pile = null then
         return True;
      else
         return False;
      end if;
   end est_vide;

end P_pile;
