with Ada.Text_IO;        use Ada.Text_IO;
with Ada.Integer_Text_IO;    use Ada.Integer_Text_IO;

with Alea; use Alea; -- module aléatoir

procedure devin_humain is

-- Variables
N : Integer; -- Le nombre a deviner
nb_choisi : Integer;
nb_tentative: Integer := 0;


-- Programme principal
begin

-- pour appeler la fonction fournissant un nombre aleatoire
N := Alea_1_100;

loop
   Put ("Choisir un nombre entre 1 et 100 : ");
   Get (nb_choisi);
   New_Line;

   nb_tentative := nb_tentative + 1;

   if ((nb_choisi > 100) or (nb_choisi < 1)) then
      Put ("Votre nombre n'est pas compris entre 1 et 100.");
      New_Line;
   else
      if (N = nb_choisi) then
            Put ("Vous avez trouvé le bon nombre !!");
            New_Line;
            Put ("Nombre de tentative : ");
            Put (nb_tentative);
      elsif (N > nb_choisi) then
            Put ("Votre nombre est inférieur à celui qu'il faut deviner");
      elsif (N < nb_choisi) then
            Put ("Votre nombre est supérieur à celui qu'il faut deviner");
      end if;
   end if;

   New_Line;

   exit when (N = nb_choisi);
end loop;

end devin_humain;