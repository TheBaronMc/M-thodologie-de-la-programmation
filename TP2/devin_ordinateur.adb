with Ada.Text_IO;        use Ada.Text_IO;
with Ada.Integer_Text_IO;    use Ada.Integer_Text_IO;

with Alea; use Alea; -- module aléatoir

procedure devin_ordinateur is

-- Variables
borne_sup: Integer := 100;
borne_inf: Integer := 1;
reponse: Character;
proposition: Integer := 0;

N : Integer;

-- Programme principal
begin

loop
   loop
      N := Alea_1_100;
      exit when ((N > borne_inf) and (N < borne_sup));
   end loop;

   Put ("Votre nombre : ");
   Put (N);
   New_Line;

   proposition := proposition + 1;

   loop
      Put ("Votre réponse : ");
      Get (reponse);
      New_Line;

      case reponse is
         when '=' =>
            Put ("Oui !! j'ai réussi !");
            New_Line;
            Put ("Nombre de proposition(s) : ");
            Put (proposition);
            New_Line;
         when '>' =>
            borne_inf := N;
         when '<' =>
            borne_sup := N;
         when others => 
            Put ("Mauvaise réponse.");
            New_Line;
      end case;
      exit when ((reponse = '>') or (reponse = '<') or (reponse = '='));
   end loop;
   --- Put ("borne_sup ");
   --- Put (borne_sup);
   --- New_Line;
   --- Put ("borne_inf ");
   --- Put (borne_inf);
   --- New_Line;
   exit when (reponse = '=');
end loop;

end devin_ordinateur;