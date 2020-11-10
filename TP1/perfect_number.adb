with Ada.Text_IO;        use Ada.Text_IO;
with Ada.Integer_Text_IO;    use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure perfect_number is

-- Variables
   nb: Integer;
   somme: Integer;
   
-- Programme principal
begin
   -- Demande des valeurs à l'utilisateur
   Put ("Choisir un nombre : ");
   Get (nb);
   New_Line;

   -- Traitement
   for i in Integer range 1..nb loop
    somme := 0;
    for j in Integer range 1..(i-1) loop
       if ((i mod j)=0) then
          somme := somme + j;
       end if;
    end loop; 
    if (i=somme) then
       Put ("Le nombre suivant est parfait : ");
       Put (i);
       New_Line;
    end if;     
   end loop;

End perfect_number;