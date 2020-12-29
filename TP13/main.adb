with p_liste;
with p_liste_integer;

procedure Main is
   package p_liste_entier is
     new p_liste(T_Element => Integer);
   use p_liste_entier;

   package p_liste_entier_op is
     new p_liste_integer(p_liste_int => p_liste_entier);
   use p_liste_entier_op;

   p: liste_chainee;
begin
   --  Insert code here.
   p := creer_liste_vide;

   inserer_en_tete( nouveau => 1, liste   => p);
   inserer_en_tete( nouveau => 3, liste   => p);
   inserer_en_tete( nouveau => 5, liste   => p);

   affiche_liste(liste => p);

   inserer_avant(data    => 3, nouveau => 4, liste   => p);
   inserer_apres(nouveau => 2, data    => 3, liste   => p);

   affiche_liste(liste => p);

   enlever(e     => 4, liste => p);
   enlever(e     => 3, liste => p);

   affiche_liste(liste => p);
end Main;
