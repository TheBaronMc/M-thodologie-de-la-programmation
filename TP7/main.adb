with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Main is
   NMAX : Integer := 10;

   Type tableau_booleen is array(1..NMAX) of Boolean;
   Type tableau_flottant is array(1..NMAX) of Float;

   Type tableau is record
      bool_tab : tableau_booleen := (others => False);
      flot_tab : tableau_flottant := (others => 0.0);
      nb_elmt : Integer := 0;
   end record;

   tab : tableau;

   imin : Integer := 1;
   imax : Integer := 0;

   -- nom : ajout_valeur
   -- sémantique: Ajout d'une valeur dans le tableau
   -- paramètres:
   --  valeur : In Float; -- Valeur à ajouté dans le tableau
   --  bool_tab : In tableau_booleen; -- tableau indiquant les valeurs effectives
   --  flot_tab : In/Out tableau_float; -- tableau contenant les valeurs
   --  nb_elmt : In/Out Integer; -- nombre d'éléments contenu dans le tableau
   --  imin : In Integer; -- borne min des valeurs effectives
   --  imax : In Integer; -- borne max des valeurs effectives
   -- pré-condition: Conditions sur les paramètres en entrée (in)
   -- post-condition:
   --  Les valeurs imin imax seront ajuster en conséquence.
   --  Le nombre d'élément sera modiffier.
   procedure ajout_valeur (valeur : in Float; bool_tab : in out tableau_booleen; flot_tab : in out tableau_flottant; nb_elmt : in out Integer; imin : in out Integer; imax : in out Integer; NMAX : in Integer) is
      indice : Integer := 0;
   begin
      -- Récupération de l'indice d'une case libre
      loop
         indice := indice + 1;
         if not bool_tab(indice) then
            -- Inscrire la valeur dans cette case
            bool_tab(indice) := True;
            flot_tab(indice) := valeur;
            -- Changer les bornes des valeurs effectives
            if (indice < imin) then
               imin := indice;
            end if;
            if (indice > imax) then
               imax := indice;
            end if;
            nb_elmt := nb_elmt + 1;
            exit;
         end if;
         exit when indice = NMAX;
      end loop;

   end;

   -- nom : premiere_occurrence_valeur
   -- sémantique: Renvoie l'indice de la case si la valeur est trouvé
   -- paramètres:
   --  valeur : In Float; -- Valeur à chercher
   --  bool_tab : In tableau_booleen; -- tableau indiquant les valeurs effectives
   --  flot_tab : In/Out tableau_float; -- tableau contenant les valeurs
   --  imin : In Integer; -- borne min des valeurs effectives
   --  imax : In Integer; -- borne max des valeurs effectives
   -- pré-condition: Au moins une valeur doit avoir été ajouté dans le tableau
   function premiere_occurrence_valeur (valeur : in Float; bool_tab : in tableau_booleen; flot_tab : in tableau_flottant; imin : in Integer; imax : in Integer) return Integer is
   begin
      for i in imin..imax loop
         if (bool_tab(i) and (flot_tab(i) = valeur)) then
                return i;
             end if;
      end loop;
      return 0;
   end;

   -- nom : suppression_valeur
   -- sémantique: supprime une valeur du tableau
   -- paramètres:
   --  indice : In Integer; -- Indice de la valeur à supprimer
   --  bool_tab : In tableau_booleen; -- tableau indiquant les valeurs effectives
   --  flot_tab : In/Out tableau_float; -- tableau contenant les valeurs
   --  nb_elmt : In Integer; -- nombre d'éléments contenu dans le tableau
   --  imin : In/Out Integer; -- borne min des valeurs effectives
   --  imax : In/Out Integer; -- borne max des valeurs effectives
   -- pré-condition: Conditions sur les paramètres en entrée (in)
   -- post-condition: Conditions sur les paramètres en sortie (out)
   procedure suppression_valeur (indice : in Integer; bool_tab : in out tableau_booleen; nb_elmt : in out Integer; imin : in out Integer; imax : in out Integer) is
   begin
      bool_tab(indice) := False;
      nb_elmt := nb_elmt - 1;

      if (indice = imin) then
         imin := imin + 1;
      end if;

      if (indice = imax) then
         imax := imax - 1;
      end if;
   end;

   -- nom : affiche_tableau
   -- sémantique: affiche le tableau
   -- paramètres:
   --  bool_tab : In tableau_booleen; -- tableau indiquant les valeurs effectives
   --  flot_tab : In/Out tableau_float; -- tableau contenant les valeurs
   --  imin : In Integer; -- borne min des valeurs effectives
   --  imax : In Integer; -- borne max des valeurs effectives
   -- pré-condition: Conditions sur les paramètres en entrée (in)
   -- post-condition: Conditions sur les paramètres en sortie (out)
   procedure affiche_tableau (bool_tab : in tableau_booleen; flot_tab : in tableau_flottant; imin : in Integer; imax : in Integer) is
   begin

      Put ("Indice min = "&Integer'Image(imin));
      New_Line;
      Put ("Indice max = "&Integer'Image(imax));
      New_Line;
      Put ("=====================================");
      New_Line;
      Put ("           tableau de      tableau de");
      New_Line;
      Put ("indices    booléens        valeurs");
      New_Line;
      Put ("=====================================");
      New_Line;
      for i in imin..imax loop
         Put ("    "&Integer'Image(i)&"       "&Boolean'Image(bool_tab(i))&"          "&Float'Image(flot_tab(i)));
         New_Line;
      end loop;
      Put ("=====================================");
      New_Line;


   end;

   -- nom : compactage_tableau
   -- sémantique: compacte le tableau
   -- paramètres:
   --  nb_elmt : In Integer; -- nombre d'éléments contenu dans le tableau
   --  bool_tab : In tableau_booleen; -- tableau indiquant les valeurs effectives
   --  flot_tab : In/Out tableau_float; -- tableau contenant les valeurs
   --  imin : In Integer; -- borne min des valeurs effectives
   --  imax : In Integer; -- borne max des valeurs effectives
   -- pré-condition: le tableau ne doit pas être vide
   -- post-condition: Conditions sur les paramètres en sortie (out)
   procedure compactage_tableau (bool_tab : in out tableau_booleen; flot_tab : in out tableau_flottant; nb_elmt : in Integer; imin : in Integer; imax : in out Integer) is
      y : Integer;
      last_index_true : Integer;
   begin
      for i in imin..imax loop
         if not bool_tab(i) then
            y := i;
            loop
               if bool_tab(y) then
                  bool_tab(y) := False;
                  bool_tab(i) := True;
                  flot_tab(i) := flot_tab(y);
                  last_index_true := i;
                  exit;
               end if;
               y := y + 1;
               exit when y = imax + 1;
            end loop;
         else
            last_index_true := i;
         end if;
      end loop;
      imax := last_index_true;
   end;

   i : Integer;

begin
   --  AJOUT
      ajout_valeur( valeur   => 1.0,
                    bool_tab => tab.bool_tab,
                    flot_tab => tab.flot_tab,
                    nb_elmt  => tab.nb_elmt,
                    imin     => imin,
                    imax     => imax,
                    NMAX     => NMAX);
   Put ("Ajout 1.0 : imin="&Integer'Image(imin)&" imax="&Integer'Image(imax)&" nb_elmt="&Integer'Image(tab.nb_elmt));
   New_Line;
   affiche_tableau (bool_tab => tab.bool_tab,
                    flot_tab => tab.flot_tab,
                    imin     => imin,
                    imax     => imax);

      ajout_valeur( valeur   => 2.0,
                    bool_tab => tab.bool_tab,
                    flot_tab => tab.flot_tab,
                    nb_elmt  => tab.nb_elmt,
                    imin     => imin,
                    imax     => imax,
                    NMAX     => NMAX);
   Put ("Ajout 2.0 : imin="&Integer'Image(imin)&" imax="&Integer'Image(imax)&" nb_elmt="&Integer'Image(tab.nb_elmt));
   New_Line;
   affiche_tableau (bool_tab => tab.bool_tab,
                    flot_tab => tab.flot_tab,
                    imin     => imin,
                    imax     => imax);

      ajout_valeur( valeur   => 3.0,
                    bool_tab => tab.bool_tab,
                    flot_tab => tab.flot_tab,
                    nb_elmt  => tab.nb_elmt,
                    imin     => imin,
                    imax     => imax,
                    NMAX     => NMAX);
   Put ("Ajout 3.0 : imin="&Integer'Image(imin)&" imax="&Integer'Image(imax)&" nb_elmt="&Integer'Image(tab.nb_elmt));
   New_Line;
   affiche_tableau (bool_tab => tab.bool_tab,
                    flot_tab => tab.flot_tab,
                    imin     => imin,
                    imax     => imax);

      ajout_valeur( valeur   => 4.0,
                    bool_tab => tab.bool_tab,
                    flot_tab => tab.flot_tab,
                    nb_elmt  => tab.nb_elmt,
                    imin     => imin,
                    imax     => imax,
                    NMAX     => NMAX);
   Put ("Ajout 4.0 : imin="&Integer'Image(imin)&" imax="&Integer'Image(imax)&" nb_elmt="&Integer'Image(tab.nb_elmt));
   New_Line;
   affiche_tableau (bool_tab => tab.bool_tab,
                    flot_tab => tab.flot_tab,
                    imin     => imin,
                    imax     => imax);

      ajout_valeur( valeur   => 5.0,
                    bool_tab => tab.bool_tab,
                    flot_tab => tab.flot_tab,
                    nb_elmt  => tab.nb_elmt,
                    imin     => imin,
                    imax     => imax,
                    NMAX     => NMAX);
   Put ("Ajout 5.0 : imin="&Integer'Image(imin)&" imax="&Integer'Image(imax)&" nb_elmt="&Integer'Image(tab.nb_elmt));
   New_Line;
   affiche_tableau (bool_tab => tab.bool_tab,
                    flot_tab => tab.flot_tab,
                    imin     => imin,
                    imax     => imax);

      -- SUPPRESSION
      suppression_valeur ( indice   => 1,
                           bool_tab => tab.bool_tab,
                           nb_elmt  => tab.nb_elmt,
                           imin     => imin,
                           imax     => imax);
   Put ("supprime 1 : imin="&Integer'Image(imin)&" imax="&Integer'Image(imax)&" nb_elmt="&Integer'Image(tab.nb_elmt));
   New_Line;
   affiche_tableau (bool_tab => tab.bool_tab,
                    flot_tab => tab.flot_tab,
                    imin     => imin,
                    imax     => imax);

      suppression_valeur ( indice   => 3,
                           bool_tab => tab.bool_tab,
                           nb_elmt  => tab.nb_elmt,
                           imin     => imin,
                           imax     => imax);
   Put ("supprime 3 : imin="&Integer'Image(imin)&" imax="&Integer'Image(imax)&" nb_elmt="&Integer'Image(tab.nb_elmt));
   New_Line;
   affiche_tableau (bool_tab => tab.bool_tab,
                    flot_tab => tab.flot_tab,
                    imin     => imin,
                    imax     => imax);

      suppression_valeur ( indice   => 5,
                           bool_tab => tab.bool_tab,
                           nb_elmt  => tab.nb_elmt,
                           imin     => imin,
                           imax     => imax);
   Put ("supprime 5 : imin="&Integer'Image(imin)&" imax="&Integer'Image(imax)&" nb_elmt="&Integer'Image(tab.nb_elmt));
   New_Line;
   affiche_tableau (bool_tab => tab.bool_tab,
                    flot_tab => tab.flot_tab,
                    imin     => imin,
                    imax     => imax);

   -- AJOUT
         ajout_valeur( valeur   => 2.5,
                       bool_tab => tab.bool_tab,
                       flot_tab => tab.flot_tab,
                       nb_elmt  => tab.nb_elmt,
                       imin     => imin,
                       imax     => imax,
                       NMAX     => NMAX);
   Put ("Ajout 2.5 : imin="&Integer'Image(imin)&" imax="&Integer'Image(imax)&" nb_elmt="&Integer'Image(tab.nb_elmt));
   New_Line;
   affiche_tableau (bool_tab => tab.bool_tab,
                    flot_tab => tab.flot_tab,
                    imin     => imin,
                    imax     => imax);

         ajout_valeur( valeur   => 1.5,
                       bool_tab => tab.bool_tab,
                       flot_tab => tab.flot_tab,
                       nb_elmt  => tab.nb_elmt,
                       imin     => imin,
                       imax     => imax,
                       NMAX     => NMAX);
   Put ("Ajout 1.5 : imin="&Integer'Image(imin)&" imax="&Integer'Image(imax)&" nb_elmt="&Integer'Image(tab.nb_elmt));
   New_Line;
   affiche_tableau (bool_tab => tab.bool_tab,
                    flot_tab => tab.flot_tab,
                    imin     => imin,
                    imax     => imax);

         ajout_valeur( valeur   => 4.0,
                       bool_tab => tab.bool_tab,
                       flot_tab => tab.flot_tab,
                       nb_elmt  => tab.nb_elmt,
                       imin     => imin,
                       imax     => imax,
                       NMAX     => NMAX);

   Put ("Ajout 4.0 : imin="&Integer'Image(imin)&" imax="&Integer'Image(imax)&" nb_elmt="&Integer'Image(tab.nb_elmt));
   New_Line;
   affiche_tableau (bool_tab => tab.bool_tab,
                    flot_tab => tab.flot_tab,
                    imin     => imin,
                    imax     => imax);

   -- COMPACTER
   compactage_tableau (bool_tab => tab.bool_tab,
                       flot_tab => tab.flot_tab,
                       nb_elmt  => tab.nb_elmt,
                       imin     => imin,
                       imax     => imax);
   Put ("Compactage : imin="&Integer'Image(imin)&" imax="&Integer'Image(imax)&" nb_elmt="&Integer'Image(tab.nb_elmt));
   New_Line;
   affiche_tableau (bool_tab => tab.bool_tab,
                    flot_tab => tab.flot_tab,
                    imin     => imin,
                    imax     => imax);

   -- CHERCHER
   i := premiere_occurrence_valeur ( valeur   => 4.0,
                                     bool_tab => tab.bool_tab,
                                     flot_tab => tab.flot_tab,
                                     imin     => imin,
                                     imax     => imax);
        Put ("Première occurrence de 4.0 : "&Integer'Image(i));
        New_Line;

   i := premiere_occurrence_valeur ( valeur   => 1.0,
                                     bool_tab => tab.bool_tab,
                                     flot_tab => tab.flot_tab,
                                     imin     => imin,
                                     imax     => imax);
        Put ("Première occurrence de 1.0 : "&Integer'Image(i));
        New_Line;

   -- SUPPRESSION
   suppression_valeur ( indice   => 3,
                        bool_tab => tab.bool_tab,
                        nb_elmt  => tab.nb_elmt,
                        imin     => imin,
                        imax     => imax);
   Put ("supprime 3 : imin="&Integer'Image(imin)&" imax="&Integer'Image(imax)&" nb_elmt="&Integer'Image(tab.nb_elmt));
   New_Line;
   affiche_tableau (bool_tab => tab.bool_tab,
                    flot_tab => tab.flot_tab,
                    imin     => imin,
                    imax     => imax);

   suppression_valeur ( indice   => 4,
                        bool_tab => tab.bool_tab,
                        nb_elmt  => tab.nb_elmt,
                        imin     => imin,
                        imax     => imax);
   Put ("supprime 4 : imin="&Integer'Image(imin)&" imax="&Integer'Image(imax)&" nb_elmt="&Integer'Image(tab.nb_elmt));
   New_Line;
   affiche_tableau (bool_tab => tab.bool_tab,
                    flot_tab => tab.flot_tab,
                    imin     => imin,
                    imax     => imax);

   -- CHERCHER
   i := premiere_occurrence_valeur ( valeur   => 4.0,
                                     bool_tab => tab.bool_tab,
                                     flot_tab => tab.flot_tab,
                                     imin     => imin,
                                     imax     => imax);
        Put ("Première occurrence de 4.0 : "&Integer'Image(i));
        New_Line;

   -- COMPACTER
   affiche_tableau (bool_tab => tab.bool_tab,
                    flot_tab => tab.flot_tab,
                    imin     => imin,
                    imax     => imax);
   compactage_tableau (bool_tab => tab.bool_tab,
                       flot_tab => tab.flot_tab,
                       nb_elmt  => tab.nb_elmt,
                       imin     => imin,
                       imax     => imax);
   Put ("Compactage : imin="&Integer'Image(imin)&" imax="&Integer'Image(imax)&" nb_elmt="&Integer'Image(tab.nb_elmt));
   New_Line;
   affiche_tableau (bool_tab => tab.bool_tab,
                    flot_tab => tab.flot_tab,
                    imin     => imin,
                    imax     => imax);



end Main;