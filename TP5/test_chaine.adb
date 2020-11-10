with Ada.Text_IO;        use Ada.Text_IO;
with Ada.Integer_Text_IO;    use Ada.Integer_Text_IO;

procedure test_chaine is

CMAX : constant INTEGER :=80; -- taille maximum de la chaine
nom : STRING(1..CMAX);  -- une chaine
lnom : Integer;

begin-- remplissage des 20 premiers caract`eres avec des ’a’
for i in 1..20 loop
    nom(i) := 'a';
end loop; -- affichage des 10 premiers caract`eres

for i in 1..10 loop
    put(nom(i));
end loop;

-- m^eme chose mais avec retour `a la ligne
put_line(nom(1..10));
-- affichage des 10 premiers caract`eres
put(nom(1..10)); 

-- saisie de nom ET de lnom
put("Taper un nom :");
get_line(nom, lnom);

end test_chaine;