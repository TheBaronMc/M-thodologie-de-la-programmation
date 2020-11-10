with Ada.Text_IO;        use Ada.Text_IO;
with Ada.Integer_Text_IO;    use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure puissances is

-- Variables
   nb: Float;
   exposant: Float;
   nb_inter: Float;
   
-- Programme principal
begin
   -- Demande des valeurs à l'utilisateur
   Put ("Choisir un nombre : ");
   Get (nb);
   Put ("Choisir un exposant : ");
   Get (exposant);
   
   -- Traitement
   if (exposant = 0.0) then
      nb := 1.0;
   elsif (abs(exposant) >= 2.0) then
      nb_inter := nb;
      for i in Integer range 2..Integer(exposant) loop
         nb := nb * nb_inter;
      end loop;
   end if;

   if (exposant <= -1.0) then
        nb := 1.0/nb;
      end if;

   Put ("Résultat : ");
   Put (nb);

End puissances;