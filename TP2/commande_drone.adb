with Ada.Text_IO;        use Ada.Text_IO;
with Ada.Integer_Text_IO;    use Ada.Integer_Text_IO;

procedure commande_drone is

-- Variables
altitude: Integer := 0;
demarrer: Boolean := false;
choix: Character;

-- Programme principal
begin

   loop
    -- affichage du menu et choix utilisateur
    loop
    Put ("========== MENU DU DRONE ==========");
    New_Line;
    Put ("(d)émarrer");
    New_Line;
    Put ("(m)onter");
    New_Line;
    Put ("de(s)cendre");
    New_Line;
    Put ("(q)uitter");
    New_Line;
    Get (choix);

    exit when (choix='d' or choix='m' or choix='s' or choix='q');
    end loop;

    case choix is
       when 'd' =>
        if (not demarrer) then
         demarrer := true;  
         Put ("activation de votre drone");
         New_Line;
        else 
         Put ("Le drone est déjà actif");
         New_Line;
        end if;

       when 'm' =>
        if (demarrer) then
         altitude := altitude + 1;
         Put ("Votre altitude : ");
         Put (altitude);
         New_Line;
         if (altitude>=5) then
          Put ("Drone hors de porté");
          New_Line;
         end if;
        else
         Put ("Vous devez démarrer le drone");
         New_Line;  
        end if;

       when 's' =>
       
      if (demarrer) then
      if (altitude=0) then
         Put ("Le drone est déjà au sol");
         New_Line;
      else
         altitude := altitude - 1;
         if (altitude=0) then
            Put ("Le drone vient de se posé");
            New_Line;
         else
            Put ("L'altitude du drone : ");
            Put (altitude);
            New_Line;
         end if;
      end if;
      else
      Put ("Vous devez démarrer le drone");
      New_Line;
      end if;

       when 'q' =>
        Put ("Vous quittez le menu.");
        New_Line;
       when others => 
        Put ("Mauvais choix;");
        New_Line;
    end case;

    exit when ((choix='q')or(altitude>=5));
   end loop;

End commande_drone;