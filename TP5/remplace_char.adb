with Ada.Text_IO;        use Ada.Text_IO;
with Ada.Integer_Text_IO;    use Ada.Integer_Text_IO;

procedure remplace_char is

CMAX : constant INTEGER :=80; -- taille maximum de la chaine
chaine : STRING(1..CMAX);  -- une chaine
lchaine : Integer;

begin
    -- Saisie de la chaine
    Put ("Veuillez saisir la chaine : ");
    get_line(chaine, lchaine);
    New_Line;

    -- Traitement
    for J in 1..lchaine loop
       if (chaine(J) = 'a') then
            chaine(J) := 'b';
       end if;
    end loop;

    -- Affichage
    Put ("Chaine après traitement : ");
    Put_line(chaine);

end remplace_char;