with Ada.Text_IO;        use Ada.Text_IO;
with Ada.Integer_Text_IO;    use Ada.Integer_Text_IO;

procedure incr_tab is

-- Variables
NMAX : constant INTEGER := 5; -- Indice maximum du tableau
TYPE TAB_ENTIERS is ARRAY(1.. NMAX) of INTEGER;

type My_tab is record
    un_tab : TAB_ENTIERS; -- un tableau d’au maximum NMAX entiers
    nb_elements : INTEGER := 0; -- le nombre effectif d’ ́el ́ements (<= NMAX) de un_tab.
end record;

tab : My_tab;

-- Programme principal
begin

tab.un_tab (1..3):= (1,2,3);
tab.nb_elements := 3;

-- Affichage 
Put ("[");
for J in 1..tab.nb_elements loop
   Put (tab.un_tab (J));
   if (J /= tab.nb_elements) then
      Put (",");
   end if;
end loop;
Put ("]");
New_Line;

for J in 1..tab.nb_elements loop
   tab.un_tab (J) := tab.un_tab (J) + 1 ;
end loop;


-- Affichage 
Put ("[");
for J in 1..tab.nb_elements loop
   Put (tab.un_tab (J));
   if (J /= tab.nb_elements) then
      Put (",");
   end if;
end loop;
Put ("]");

end incr_tab;