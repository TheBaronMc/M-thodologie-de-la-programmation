with Ada.Text_IO;        use Ada.Text_IO;
with Ada.Integer_Text_IO;    use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure racine_newton is

-- Variables
   Ak0: Standard.Float := 1.0;
   Ak1: Standard.Float;
   precision: Standard.Float;
   x: Standard.Float;


-- Programme principal
begin
   
   Put ("Choisir un entier : ");
   Get (x);
   New_Line;
   Put ("Choisir une précision : ");
   Get (precision);
   New_Line;

   loop
      Ak1 := 0.5 * (Ak0 + (x / Ak0));
      exit when (abs(Ak1 - Ak0) < precision);
      Ak0 := Ak1;
   end loop;
     
   Put ("Résultat : ");
   Put (Ak1);
   New_Line;

End racine_newton;