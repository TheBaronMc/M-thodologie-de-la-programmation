with Ada.Text_IO;        use Ada.Text_IO;
with Ada.Integer_Text_IO;    use Ada.Integer_Text_IO;

procedure affiche_tab is

-- Variables
NMAX : constant INTEGER := 5; -- Indice maximum du tableau
TYPE TAB_ENTIERS is ARRAY(1.. NMAX) of INTEGER;

type My_tab is record
    un_tab : TAB_ENTIERS; -- un tableau d’au maximum NMAX entiers
    nb_elements : INTEGER := 0; -- le nombre effectif d’ ́el ́ements (<= NMAX) de un_tab.
end record;

tab : My_tab;
var : INTEGER;

-- Programme principal
begin

-- Saisie des valeurs
for J in 1..NMAX loop
   Put ("Saisir une valeur pour l'indice : ");
   New_Line;
   Get (var);
   New_Line;

   tab.un_tab (j) := var;
   tab.nb_elements := tab.nb_elements + 1;
end loop;

-- Affichage 
Put ("[");
for J in 1..tab.nb_elements loop
   Put (tab.un_tab (J));
   if (J /= 5) then
      Put (",");
   end if;
end loop;
Put ("]");

end affiche_tab;