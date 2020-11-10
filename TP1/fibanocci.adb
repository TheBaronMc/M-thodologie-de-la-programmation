with Ada.Text_IO;        use Ada.Text_IO;
with Ada.Integer_Text_IO;    use Ada.Integer_Text_IO;

procedure fibanocci is

   function fibanocci_suite (nb: in Integer) return Integer is
      Resultat: Integer;
   begin
      if (nb<=1) then
         Resultat := nb;
      else
         Resultat := fibanocci_suite (nb-1) + fibanocci_suite (nb-2);
      end if;
      return Resultat;
   end fibanocci_suite;


-- Variables
   nb: Integer;
   choix: Integer;
   m: Integer;
   i: Integer := 0;
-- Programme principal
begin
   -- Menu utilisateur
   loop
      Put ("============================ MENU ============================");
      New_Line;
      Put ("1) Afficher len−imeterme de la suite de Fibonacci");
      New_Line;
      Put ("2) Afficher le 1er terme de la suite de Fibonacci supérieur à M");
      New_Line;
      Get (choix);
      exit when (choix = 1 or choix = 2);
   end loop;

   if (choix=1) then
      -- Demande des valeurs à l'utilisateur
      Put ("Choisir un nombre : ");
      Get (nb);
      New_Line;
   
      -- Traitement
      nb := fibanocci_suite (nb);
   elsif (choix=2) then
      loop
         Put ("Choisir M : ");
         Get (m);
         exit when (m > 1 );
      end loop;

      loop
         nb := fibanocci_suite (i);
         exit when (nb > m);
         i := i + 1;
      end loop;
   end if;

   Put ("Résultat : ");
   Put (nb);
   New_Line;

End fibanocci;