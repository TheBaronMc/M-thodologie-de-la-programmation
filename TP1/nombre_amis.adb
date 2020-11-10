with Ada.Text_IO;        use Ada.Text_IO;
with Ada.Integer_Text_IO;    use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure nombre_amis is

-- Variables
   somme_n: Integer;
   somme_m: Integer;
   max: Integer;
   
-- Programme principal
begin
   -- Demande des valeurs à l'utilisateur
   loop
      Put ("Choisir une valeur MAX : ");
      Get (max);  
      exit when (max>=3);
   end loop;

   -- Traitement
   for m in Integer range 1..max loop
    somme_m := 0;
    for j in Integer range 1..(m-1) loop
       if ((m mod j)=0) then
          somme_m := somme_m + j;
       end if;
    end loop; 

    for n in Integer range 1..(m-1) loop
       somme_n := 0;
       for k in Integer range 1..(n-1) loop
            if ((n mod k)=0) then
            somme_n := somme_n + k;
            end if;
        end loop; 
        if ((somme_m = n) and (somme_n = m)) then
           Put ("les nombres suivant sont amis : ");
           Put (m);
           Put (n);
           New_Line;
        end if;
    end loop;    
   end loop;

End nombre_amis;