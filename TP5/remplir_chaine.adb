with Ada.Text_IO;        use Ada.Text_IO;
with Ada.Integer_Text_IO;    use Ada.Integer_Text_IO;

procedure remplir_char is

alaphabet : constant STRING(1..26) := "abcdefghijklmnopqrstuvwxyz";
lalphabet : constant Integer := 26;

CMAX : constant INTEGER :=80; -- taille maximum de la chaine

chaine1 : STRING(1..CMAX);  -- une chaine
lchaine1 : Integer;
chaine2 : STRING(1..CMAX);  -- une chaine
lchaine2 : Integer := 1;

isletter : Boolean;

begin
    -- Saisie de la chaine
    Put ("Veuillez saisir la chaine : ");
    get_line(chaine1, lchaine1);
    New_Line;

    -- Traitement
    for J in 1..lchaine1 loop
        isletter := False;
       for i in 1..lalphabet loop
          if (alaphabet(i) = chaine1(J)) then
             isletter := True;
          end if;
       end loop;
       if not isletter then
        chaine2(lchaine2) := chaine1(J);
        lchaine2 := lchaine2 + 1;
       end if;
    end loop;

    -- Affichage
    Put ("Voilà tous les caractère qui ne sont pas des lettres : ");
    Put_line(chaine2);

end remplir_char;