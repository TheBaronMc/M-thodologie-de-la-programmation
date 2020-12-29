with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Main is

   procedure affiche(m : in integer; n : in integer) is
   begin
      for a in 0..m loop
         -- afficher une ligne de nombres
         for b in 0.. n loop
            -- afficher un nombre
            put(10*a + b);
         end loop;
         new_line;
      end loop;
   end affiche;

   procedure affiche_recursive(m : in integer; n : in integer) is
   begin
      if m <= 0 then

         for b in 0.. n loop
               -- afficher un nombre
               put(10*abs(m) + b);
            end loop;

      else
         for a in 0..m loop
            -- afficher une ligne de nombres
            affiche_recursive (a*(-1), n);
            new_line;
         end loop;
      end if;
   end affiche_recursive;


begin
   --  Insert code here.
   affiche_recursive (m => 4,
                      n => 4);
end Main;
