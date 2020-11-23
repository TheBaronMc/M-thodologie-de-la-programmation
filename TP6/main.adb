with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Main is

   type BINAIRE is array(0..7) of Integer;

   procedure affiche_binaire (nombre_binaire : in BINAIRE) is
      -- nom : affiche_binaire
      -- sémantique: affiche un nombre binaire à l'écran
      -- paramètres:
      --  nombre_binaire : In BINAIRE; -- Nombre binaire à afficher
      -- pré-condition: Le nombre doit être codé sur 8 bits
   begin
      Put ("indices :  0  1  2  3  4  5  6  7");
      New_Line;
      Put ("valeurs : "& Integer'Image( nombre_binaire (0) ) &" "&Integer'Image( nombre_binaire (1) )&" "&Integer'Image( nombre_binaire (2) )&" "&Integer'Image( nombre_binaire (3) )&" "&Integer'Image( nombre_binaire (4) )&" "&Integer'Image( nombre_binaire (5) )&" "&Integer'Image( nombre_binaire (6) )&" "&Integer'Image( nombre_binaire (7) ));
      New_Line;
   end;


   function bintaire_en_base10 (nombre_binaire : in BINAIRE) return Integer is
      -- nom : bintaire_en_base10
      -- sémantique: convertion d'un nombre binaire en décimal
      -- paramètres:
      --  nombre_binaire : In BINAIRE; -- Nombre à convertir
      nombre_decimal : Integer := 0;
   begin
      nombre_decimal := (nombre_binaire(0) * 2**0) + (nombre_binaire(1) * 2**1) +  (nombre_binaire(2) * 2**2) + (nombre_binaire(3) * 2**3) + (nombre_binaire(4) * 2**4) + (nombre_binaire(5) * 2**5) + (nombre_binaire(6) * 2**6) + (nombre_binaire(7) * 2**7);
      return nombre_decimal;
   end;

   function base10_en_binaire (nombre_decimal : in Integer) return BINAIRE is
      -- nom : base10_en_binaire
      -- sémantique: convertion d'un nombre décimal en binaire
      -- paramètres:
      --  nombre_decimal : In; -- Nombre à convertir
      nombre_binaire : BINAIRE := (others => 0);
      nb_dec : Integer := nombre_decimal;
   begin
      for i in 0..7 loop
         if (nb_dec >= 2**(7-i)) then
            nombre_binaire(7-i) := 1;
            nb_dec := nb_dec - 2**(7-i);
         else
            nombre_binaire(7-i) := 0;
         end if;
      end loop;

      return nombre_binaire;
   end;

   function addition (nombre_binaire1 : in BINAIRE; nombre_binaire2 : in BINAIRE) return BINAIRE is
      -- nom : addition
      -- sémantique: addition de deux nombres binaires
      -- paramètres:
      --  nombre_binaire1 : In BINAIRE; -- Premier terme de l'addition
      --  nombre_binaire2 : In BINAIRE; -- Deuxième terme de l'addition
      -- pré-condition: La somme des deux termes ne doit pas être suceptible de dépasser 256
      somme : BINAIRE := (others => 0);
      somme_dec : Integer := 0;
   begin
      somme_dec := bintaire_en_base10(nombre_binaire => nombre_binaire1) + bintaire_en_base10(nombre_binaire => nombre_binaire2);
      somme := base10_en_binaire(nombre_decimal => somme_dec);
      return somme;
   end;

   nombre1 : Integer := 0;
   nombre1_binaire : BINAIRE := (others => 0);
   nombre2 : Integer:= 0;
   nombre2_binaire : BINAIRE := (others => 0);

   somme : Integer := 0;
   somme_binaire : BINAIRE := (others => 0);

begin
   --  Insert code here.
   Put ("Choisir nombre1 : ");
   Get (nombre1);

   Put ("nombre1 en binaire : ");
   New_Line;
   nombre1_binaire := base10_en_binaire (nombre_decimal => nombre1);
   affiche_binaire (nombre_binaire => nombre1_binaire);

   Put ("Choisir nombre2 : ");
   Get (nombre2);

   Put ("nombre2 en binaire : ");
   New_Line;
   nombre2_binaire := base10_en_binaire (nombre_decimal => nombre2);
   affiche_binaire (nombre_binaire => nombre2_binaire);

   somme_binaire := addition (nombre_binaire1 => nombre1_binaire,
                      nombre_binaire2 => nombre2_binaire);

   Put ("La somme de vos deux nombres en binaire");
   New_Line;
   affiche_binaire (nombre_binaire => somme_binaire);

   somme := bintaire_en_base10 (nombre_binaire => somme_binaire);
   Put ("La somme en décimal : "&Integer'Image(somme));


end Main;
