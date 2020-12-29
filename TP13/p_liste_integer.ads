with p_liste;

generic
   with package p_liste_int is new p_liste(T_Element => Integer) ;
package p_liste_integer is
   use p_liste_int;

   procedure affiche_liste (liste: in liste_chainee);

   function rechercher (e: in Integer; l: in liste_chainee) return liste_chainee;

end p_liste_integer;
