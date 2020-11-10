with Ada.Text_IO;        use Ada.Text_IO;
with Ada.Integer_Text_IO;    use Ada.Integer_Text_IO;

procedure somme_ada is

-- Variables
m: constant Integer := 20;
n: constant Integer := 50;
somme: Integer := 0;

-- Programme principal
begin

   -- traitement
   for i in Integer range m .. n loop
      somme := somme + i;
   end loop;

   Put ("La somme de i allant de n à m = ");
   Put (somme);
   New_Line;

End somme_ada;
