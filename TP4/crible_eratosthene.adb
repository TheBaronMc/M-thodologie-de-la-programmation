with Ada.Text_IO;        use Ada.Text_IO;
with Ada.Integer_Text_IO;    use Ada.Integer_Text_IO;

procedure crible_eratosthene is

-- Variables
NMAX : constant INTEGER := 5; -- Indice maximum du tableau
TYPE TAB_ENTIERS is ARRAY(1.. NMAX) of INTEGER;

type booltab is array(1..10000) of Boolean;

type My_tab is record
    un_tab : TAB_ENTIERS; -- un tableau d’au maximum NMAX entiers
    nb_elements : INTEGER := 0; -- le nombre effectif d’ ́el ́ements (<= NMAX) de un_tab.
end record;

N : INTEGER;

value_tab : booltab := (others => True);
entiers_tab : My_tab;

x : INTEGER;

-- Programme principal
begin

entiers_tab.un_tab(1..4) := (2, 3, 5, 7);
entiers_tab.nb_elements := 4;

-- Saisie des valeurs
Put ("Saisir une valeur N : ");
Get (N);

-- Traitement
for i in 1..entiers_tab.nb_elements loop
    x := entiers_tab.un_tab(i);
    while (x>=N) loop
        value_tab(x) := False;
        x := x + entiers_tab.un_tab(i);
    end loop;
end loop;

-- Affichage 
Put ("[");
for J in 2..N loop
    if value_tab(J) then
        Put (J);
    end if;
    if (J /= N) then
        Put (",");
    end if;
end loop;
Put ("]");

end crible_eratosthene;