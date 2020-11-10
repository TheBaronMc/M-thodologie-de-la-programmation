with Ada.Text_IO;        use Ada.Text_IO;
with Ada.Integer_Text_IO;    use Ada.Integer_Text_IO;

procedure insert_tab is

-- Variables
NMAX : constant INTEGER := 5; -- Indice maximum du tableau
TYPE TAB_ENTIERS is ARRAY(1.. NMAX) of INTEGER;

type My_tab is record
    un_tab : TAB_ENTIERS; -- un tableau d’au maximum NMAX entiers
    nb_elements : INTEGER := 0; -- le nombre effectif d’ ́el ́ements (<= NMAX) de un_tab.
end record;

tab : My_tab;
var: INTEGER;
temp: Integer;
i: Integer;

-- Programme i /= 0 /= 0
begin

tab.un_tab (1..3):= (1,2,3);
tab.nb_elements := 3;

if (tab.nb_elements = NMAX)  then
    Put ("Insertion impossible");
else
    Put ("Choisir une valeur");
    Get (var);
    -- décalage des valeurs du tableau
    i := tab.nb_elements;
    while i /= 0 loop 
        tab.un_tab(i + 1) := tab.un_tab(i);
        i := i - 1;
    end loop;
    tab.un_tab(1) := var;
    tab.nb_elements := tab.nb_elements + 1;
end if;

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

end insert_tab;