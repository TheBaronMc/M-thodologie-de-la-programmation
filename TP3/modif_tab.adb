with Ada.Text_IO;        use Ada.Text_IO;
with Ada.Integer_Text_IO;    use Ada.Integer_Text_IO;

procedure modif_tab is

-- Variables
NMAX : constant INTEGER := 5; -- Indice maximum du tableau
TYPE TAB_ENTIERS is ARRAY(1.. NMAX) of INTEGER;

type My_tab is record
    un_tab : TAB_ENTIERS; -- un tableau d’au maximum NMAX entiers
    nb_elements : INTEGER := 0; -- le nombre effectif d’ ́el ́ements (<= NMAX) de un_tab.
end record;

tab : My_tab;
var : INTEGER;
index : INTEGER;

-- Programme principal
begin

tab.un_tab := (1,2,3,4,5);
tab.nb_elements := 5;

loop
    Put ("Choisir un index : ");
    Get (index);
    New_Line;
    exit when ((index <= NMAX) and (index >= 1));
end loop;

Put ("Choisir une valeur : ");
Get (var);
tab.un_tab (index) := var;

-- Affichage 
Put ("[");
for J in 1..tab.nb_elements loop
   Put (tab.un_tab (J));
   if (J /= 5) then
      Put (",");
   end if;
end loop;
Put ("]");

end modif_tab;