with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

with P_pile; use P_pile;

procedure Main is
   commande : STRING(1..10); -- nombre, op´eration, ...
   longueur : INTEGER; -- nb r´eel de caracteres de la commande
   n : Integer;
   top : Integer;

   pile : pointeur_T_pile := new T_pile;

   function get_top (pile: in out pointeur_T_pile) return Integer is
      n : Integer;
   begin
      if est_vide(pile => pile) then
            raise pile_est_vide;
        else
           n := sommet (pile => pile);
           depile(pile);
      end if;
      return n;
   end get_top;

   procedure operation (op : in Character; pile: in out pointeur_T_pile) is
      n1 : Integer;
      n2 : Integer;
      res : Integer;
   begin
      n1 := get_top(pile => pile);
      n2 := get_top(pile => pile);


      case op is
         when '*' => res := n1 * n2;
         when '/' => res := n1 / n2;
         when '-' => res := n1 - n2;
         when '+' => res := n1 + n2;
         when others => null;
      end case;

      empile (elmt => res, pile => pile);

      Put(res);
      New_Line;

   end operation;



begin

   init (pile => pile);

   loop

      Get_line(commande, longueur);

      exit when commande(1) = 'e';

      if commande(1) = '*' or commande(1) = '/' or commande(1) = '-' or commande(1) = '+' then
        begin
            operation (op   => commande(1), pile => pile);
            top := sommet (pile => pile);
            Put(top);
            New_Line;
         exception
            when pile_est_vide => Put_Line("Pas assez de paramètre. Ajoutez plus d'arguments.");
         end;
      else
         begin
            n := Integer'Value(commande(1..longueur));
            empile (elmt => n, pile => pile);
            top := sommet (pile => pile);
            Put(top);
            New_Line;
         exception
              when Constraint_Error => Put_Line("ERROR");
         end;
      end if;


   end loop;


end Main;
