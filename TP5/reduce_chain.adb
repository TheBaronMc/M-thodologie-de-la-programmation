with Ada.Text_IO;        use Ada.Text_IO;
with Ada.Integer_Text_IO;    use Ada.Integer_Text_IO;

procedure reduce_chain is

alaphabet : constant STRING(1..26) := "abcdefghijklmnopqrstuvwxyz";
lalphabet : constant Integer := 26;

CMAX : constant INTEGER :=80; -- taille maximum de la chaine

chaine : STRING(1..CMAX);  -- une chaine
lchaine : Integer;

isletter : Boolean;

begin
    -- Saisie de la chaine
    Put ("Veuillez saisir la chaine : ");
    get_line(chaine, lchaine);
    New_Line;

    -- Traitement
    for J in 1..lchaine loop

        isletter := False;
        for i in 1..lalphabet loop
            if (alaphabet(i) = chaine(J)) then
                isletter := True;
            end if;
        end loop;

        if not isletter then
            for k in J..lchaine loop
                chaine(k) := chaine(k+1);
            end loop;
            lchaine := lchaine - 1;
        end if;
    end loop;

    -- Affichage
    Put ("Chaine après traitement : ");
    Put_line(chaine, lchaine);

end reduce_chain;