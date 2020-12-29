with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Main is

   -- nom : fonction_maccarthy
   -- sémantique: fonction de maccarthy
   -- paramètres:
   --  n : In Integer; -- Nombre en entrée de la fonction
   -- pré-condition: N doit être un entier
   -- post-condition: Le nombre renvoyé correspond au résultat de la fonction de maccarthy
   function fonction_maccarthy (n : in Integer) return Integer is
   begin
      if n > 100 then
         return n-10;
      else
         return fonction_maccarthy( fonction_maccarthy(n => n+11) );
      end if;

   end;


begin
   for n in 0..110 loop
      Put (fonction_maccarthy(n => n));
      New_Line;
   end loop;

end Main;
