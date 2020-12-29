with Ada.Text_IO; use Ada.Text_IO;
With Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Main is
   NMAX : Integer := 100;
   type T_tab is array(1..NMAX) of Integer;

   tab : T_tab;
   nb_elmt : Integer := 0;

   indice : Integer;

   procedure affiche_droite_gauche (tab : in T_tab; nb_elmt: in Integer) is
      y: Integer := 1;
   begin
      for i in reverse 1..nb_elmt loop
         if y /= nb_elmt then
            Put (Integer'Image(tab(i))&",");
         else
            Put (Integer'Image(tab(i)));
         end if;
         y := y + 1;
      end loop;
      New_Line;
   end;

   procedure affiche_gauche_droite (tab : in T_tab; nb_elmt: in Integer) is
   begin
      for i in 1..nb_elmt loop
         if i /= nb_elmt then
            Put (Integer'Image(tab(i))&",");
         else
            Put (Integer'Image(tab(i)));
         end if;
      end loop;
      New_Line;
   end;

   function indice_de (tab: in T_tab; val: in Integer; nb_elmt: in Integer) return Integer is
      indice_val : Integer := 0;
      i : Integer := 1;
   begin
      loop
         if tab(i) = val then
            indice_val := i;
         end if;
         i := i + 1;
         exit when (i > nb_elmt) or (indice_val /= 0);
      end loop;
      return indice_val;
   end;

begin
   tab(1) := 1;
   tab(2) := 2;
   tab(3) := 3;
   tab(4) := 4;
   tab(5) := 5;

   nb_elmt := 5;

   Put_Line ("Affichage gauche à droite");
   affiche_gauche_droite(tab     => tab,
                         nb_elmt => nb_elmt);

   Put_Line ("Affichage droite à gauche");
   affiche_droite_gauche(tab     => tab,
                         nb_elmt => nb_elmt);


   indice := indice_de (tab     => tab,
                        val     => 3,
                        nb_elmt => nb_elmt);
   Put_Line ("Indice de 3 : "&Integer'Image(indice));

end Main;
