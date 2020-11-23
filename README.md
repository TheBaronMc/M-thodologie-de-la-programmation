# Méthologie de la programmation

## TP1 : Premiers programmes en Ada
***

1. ### Compiler et exécuter un programme ADA

    1. Spécifier et raffiner en langage algorithmique une un programme `somme` calculant la somme des entiers i compris entre deux entiers naturels m et n donnés, tels que m ≤ i ≤ n.

    2. Ecrire en ADA un programme affichant (si cela est possible) la somme des entiers i compris entre deux entiers naturels m et n donnés, tels que m ≤ i ≤ n.

    Mise en œuvre sur machine.

    - Compilation et exécution ADA. Le nom du fichier contenant le programme ADA doit être `somme_ada.adb`. Pour compiler `somme_ada.adb` taper :

        ```shell
        gnatmake -gnatwa somme_ada.adb
        ```
        Le programme exécutable s’appelle `somme_ada`. L’exécuter en tapant :

        ```shell
        ./somme_ada
        ```
        La commande ‘gnatclean’ efface les fichiers engendrés.
        ```shell
        gnatclean somme_ada
        ```

    > **Attention :** L’option -gnatwa demande au compilateur de signaler davantage de messages d’avertissement. Même s’ils n’empêchent pas le compilateur d’engendrer un exécutable, les avertissements correspondent généralement à des erreurs ou des maladresses qu’il faut corriger.

2. ### Calcul de la racine carrée d’un nombre (Méthode de New-ton)

    La k<sup>ième</sup> approximation de la racine carrée de x est donnée par : <code>a<sub>k+1</sub> = 0.5 ∗ (a<sub>k</sub> + x/a<sub>k</sub>)</code> sachant que a<sub>0</sub> = 1.0.

    On arrête le calcul quand la différence entre a k+1 et a k est inférieure en valeur absolue à E fixé.

    1. Spécifier et raffiner en langage algorithmique un programme `newton` calculant la racine carrée d’un nombre réel.

    2. Ecrire le code ADA du programme `newton`. La valeur et la précision seront lues au clavier.

3. ### Puissances
    Afficher la puissance entière d’un réel en utilisant somme et multiplication. On pourra commencer par traiter le cas où l’exposant est un entier naturel puis généraliser aux entiers relatifs.

4. ### Suite de Fibonacci
    Les termes de la suite de Fibonacci sont définis par la relation de récurrence suivante :
    ```math
    fib(0) = 0
    fib(1) = 1
    fib(n) = fib(n-1) + fib(n-2)si n ≥ 2
    ```

5. ### Nombres parfaits
    Écrire un programme qui affiche tous les nombres parfaits entre 2 et N , N étant lu au clavier. Un nombre parfait est un entier égal à la somme de ses diviseurs, lui exclu. Par exemple, 28 est un nombre parfait (28 = 1 + 2 + 4 + 7 + 14).

6. ### Nombres amis
    Deux nombres N et M sont amis si la somme des diviseurs de M (en excluant M lui-même) est égale à N et la somme des diviseurs de N (en excluant N lui-même) est égale à M.

    Par exemple, 220 et 284 sont amis. En effet, la somme des diviseurs de 220 hors 220 est 1 + 2 + 4 + 5 + 10 + 11 + 20 + 22 + 44 + 55 + 110 = 284 et la somme des diviseurs de 284 hors 284 est 1 + 2 + 4 + 71 + 142 = 220.

    Écrire un programme qui affiche tous les couples (N, M ) de nombres amis tels que 1 < N < M ≤ M AX, M AX étant lu au clavier.
    
    > **Indication :** Les nombres amis compris entre 2 et 100000 sont (220, 284), (1184, 1210), (2620, 2924), (5020, 5564), (6232, 6368), (10744, 10856), (12285, 14595), (17296, 18416),(66928, 66992), (67095, 71145), (63020, 76084), (69615, 87633) et (79750, 88730).

## TP2
***
> **Notions acquises à l’issue du TP :**
> - Savoir utiliser les structures de contrôle.
> -  Appliquer la méthode des raffinages.

1. ### Drone commandé par un menu en ADA

    On s’intéresse à la commande à distance d’un drone qui se déplace uniquement selon son axe vertical. On appelle “menu textuel" un affichage du type suivant fourni par un programme et permettant de prendre en compte les choix successifs d’un utilisateur :

    ```
    Que faire : (d)émarrer (m)onter de(s)cendre (q)uitter ?
    ```

    Les contraintes suivantes s’appliquent au programme gérant le menu de commande :

    - Le drone peut monter et descendre uniquement s’il a été démarré au préalable ;
    - Le drone ne peut pas descendre à une altitude négative ;
    - Le programme affiche itérativement le menu et traite chaque choix de l’utilisateur du programme jusqu’à ce que l’utilisateur choisisse de quitter (avec l’option “q") ou jusqu’à ce que le drone monte à une altitude supérieure ou égale à 5 (le drone est alors hors de portée).

    On utilisera des booléens pour faciliter la gestion des contraintes préc’edentes lorsque cela est judicieux.

    1. La structure de contrôle du niveau R1 de raffinage d’un tel programme est bien sur une répétition, mais laquelle choisir : pour, tantque ou répéter? Justifiez votre choix.

    2. La structure de contrôle (en ADA) CASE permet de réaliser ce type de sélection :

    ```ADA
    CASE expression IS
        WHEN valeur1 =>
        ... -- suite d’instructions
        WHEN valeur2 | valeur3 =>
        ... -- suite d’instructions
        ...
        WHEN OTHERS =>
        ... -- suite d’instructions
    END CASE;
    ```
    Ecrire en ADA le programme précédent.

2. ### Jeu du devin

    Ce jeu se joue à deux joueurs (un des deux joueurs sera la machine). Le premier joueur choisit un nombre entre 1 et 100. Le second joueur doit trouver ce nombre. A chaque proposition, le premier joueur indique si le nombre proposé est plus grand, plus petit ou égal au nombre à trouver.

    1. Ecrire un programme dans le quel la machine choisit un nombre et l’utilisateur doit le deviner.

        Le nombre de propositions sera affiché en fin de partie.

        NB. Pour que la machine choisisse le nombre aléatoirement, vous utiliserez la fonction Alea 1 100 (qui n’a pas de paramétre) fournissant un nombre aléatoirement choisi entre 1 et 100.

        Pour cela :

        - Utiliser les fichiers `alea.ads` et `alea.adb` et les copier dans le répertoire de travail.
        
            Download : [ici](http://singh.perso.enseeiht.fr/Course/MP/Archive.zip)
        
        - Ajouter les lignes suivantes dans votre programme :

            ```ADA
            with Alea; use Alea;

            procedure ...

            N : INTEGER; -- Le nombre a deviner

            begin
            ...
            -- pour appeler la fonction fournissant un nombre aleatoire
            N := Alea_1_100;
            ...
            end ...
            ```
    2. Ecrire un programme dans lequel l’utilisateur choisit un nombre et la machine doit le deviner. A chaque proposition de la machine vous répondrez par ‘<’ si le nombre à trouver est plus petit, ‘>’ s’il est plus grand et ‘=’ s’il est égal. (Toute autre réponse affichera un message d’erreur). 
    
        (On pourra utiliser une recherche par dichotomie pour deviner le nombre.) 
        
        En fin de partie, le nombre de propositions sera affiché.

## TP3 : Les tableaux
***

> **Notions importantes à acquérir :**
> - Comprendre la di↵érence entre taille réelle (effective) et taille maximum d’un tableau.
> - Savoir gérer correctement la taille réelle (effective) d’un tableau.

On désire manipuler un tableau à partir des déclarations suivantes :

```ADA
NMAX : constant INTEGER := 5; -- Indice maximum du tableau
TYPE TAB_ENTIERS is ARRAY(1.. NMAX) of INTEGER;
un_tab : TAB_ENTIERS; -- un tableau d’au maximum NMAX entiers
nb_elements : INTEGER; -- le nombre effectif d’éléments (<= NMAX) de un_tab.
```
NB1. On fera un fichier .adb par programme.
NB2. On choisira une valeur petite pour NMAX (par exemple 5) afin de tester plus
facilement les cas limites.

1. Raffiner, écrire en ADA et tester un programme permettant d’afficher à l’écran
le tableau un tab préalablement initialisé.

2. Raffiner, écrire en ADA et tester un programme permettant de modifier la
i ieme (i donné par l’utilisateur) composante du tableau un tab préalablement
initialisé.

3. Raffiner, écrire en ADA et tester un programme permettant d’incrémenter de
1 tous les éléments du tableau un tab préalablement initialisé.

4. Raffiner, écrire en ADA et tester un programme permettant d’afficher l’indice
de la p-ième occurrence d’une valeur dans le tableau un tab préalablement
initialisé. Si la valeur n’est pas dans le tableau en p-ième occurrence le message
”valeur non présente” sera affiché.

5. Raffiner, écrire en ADA et tester un programme permettant d’insérer une nou-
velle valeur dans la première case du tableau en décalant les autres éléments.
Si l’insertion n’est pas possible, le message ”insertion impossible” sera affiché.


## TP4 : Exercices sur les tableaux
***

1. ### Crible d’Eratosthene

Ecrire en ADA un programme qui calcule et affiche les nombres premiers compris
entre 2 et N, N lu au clavier, par la méthode du crible d’Eratosthène. Le principe
est d’associer à chaque entier entre 2 et N un état pour indiquer s’il est susceptible
d’être premier. On utilisera pour cela un tableau.

2. ### Tri par insertion

Pour trier les éléments d’un tableau, on procèdera par étapes jusqu’à ce que le
tableau soit entièrement trié : à la i eme étape on insère le (i + 1) eme élément à
sa place parmi les i éléments précédents qui sont déjà triés (méthode du joueur de
cartes).

Par exemple, pour trier le tableau `(9 2 8 5 1 7)` de taille 6, le tri passera par
les étapes suivantes : (dans ce qui suit, le ’.’ délimite la partie du tableau prise en
considération à chaque étape)

- Etape i = 1
    La partie (9) du tableau est temporairement triée. Il faut y insérer 2 (le (i + 1)<sup>eme</sup> élément) à sa place.
    ```
    (9 . 2 8 5 1 7)
    (2 . 9 8 5 1 7)
    ```
- Etape i = 2
    La partie (2 9) du tableau est temporairement triée. Il faut y insérer 8 (le (i + 1)<sup>eme</sup> élément) à sa place.
    ```
    (2 9 . 8 5 1 7)
    (2 8 . 9 5 1 7)
    ```
- Etape i = 3
    La partie (2 8 9) du tableau est temporairement triée. Il faut y insérer 5 (le (i + 1)<sup>eme</sup> élément) à sa place.
    ```
    (2 8 9 . 5 1 7)
    (2 5 8 . 9 1 7)
    ```
- Etape i = 4
    La partie (2 5 8 9) du tableau est temporairement triée. Il faut y insérer 1 (le (i + 1)<sup>eme</sup> élément) à sa place.
    ```
    (2 5 8 9 . 1 7)
    (1 2 5 8 . 9 7)
    ```
- Etape i = 5
    La partie (1 2 5 8 9) du tableau est temporairement triée. Il faut y insérer 7 (le (i + 1)<sup>eme</sup> élément) à sa place.
    ```
    (1 2 5 8 9 . 7)
    (1 2 5 7 8 . 9)
    ```
    Le tableau est trié.
    
Ecrire un programme en ADA utilisant cet algorithme de tri par insertion.

## TP5 : Manipulation de chaînes de caractères
***
### Manipulation de chaı̂nes de caractères

- Le type STRING permet de déclarer et de manipuler des chaı̂nes de caractères. Par exemple :
    ```ADA
    CMAX : constant INTEGER :=80; -- taille maximum de la chaine
    nom : STRING(1..CMAX);
    ```
    On remarquera que la taille maximale de la chaı̂ne est fixée à la déclaration :
    Une chaı̂ne de caractères ressemble donc à un tableau de caractères.

- Affectation et consultation du contenu d’une chaı̂ne
    On accède au i eme caractère d’une chaı̂ne comme on accède au i eme élément
    d’un tableau : nom(i)
    Par exemple :
    ```ADA
    CMAX : constant INTEGER :=80; -- taille maximum de la chaine
    nom : STRING(1..CMAX); -- une chaine
    ...
    begin
    -- remplissage des 20 premiers caractères avec des ’a’
    for i in 1..20 loop
        nom(i) := ’a’;
    end loop;
    -- affichage des 10 premiers caractères
    for i in 1.. 10 loops
        put(nom(i));
    end loop;
    ```
    Mais attention :
    ```ADA
    for i in 1..CMAX loop
        put(nom(i));
    end loop;
    ```
    affiche TOUS les caractères de la chaı̂ne y compris ceux qui n’ont pas été
    explicitement affectés, donc il y aura éventuellement apparition à l’écran de
    caractères parasites à partir du 21ème caractère ... Il faut donc connaı̂tre et
    garder dans une variable, le nombre réel de caractères dans la chaı̂ne (comme
    pour un tableau) pour la manipuler correctement.

- Affichage du nom (uniquement les caractères significatifs, sinon gare aux car-
actères parasites !)
    ```ADA
    ...
    -- afficher les ’lnom’ caractères significatifs de la chaine.
    put_line(nom(1..lnom));
    ...
    ```
    On voit donc encore une fois qu’une chaı̂ne se manipule comme un tableau
    avec une taille max ET une taille réelle.

- Affectation d’une chaı̂ne par une autre chaı̂ne.
Elle n’est possible que si les deux chaı̂nes contiennent le même nombre de
caractères (comme pour les tableaux).
    ```ADA
    CMAX : constant INTEGER :=80;
    -- taille maximum de la chaine
    nom : STRING(1..CMAX); -- une chaine
    nom : INTEGER;
    -- taille réelle de nom
    CMAX2 : constant INTEGER :=20;
    -- taille maximum de la chaine
    nom2 : STRING(1..CMAX2);
    -- une autre chaine
    lnom2 : INTEGER;
    -- taille réelle de nom2
    ...
    nom := "info" ;
    -- ERREUR car tailles différentes.
    nom(1..4) := "info" ;
    -- CORRECT
    lnom := ...;
    lnom2 := ... ;
    nom2(1..lnom2) := ... ;
    nom(1.. lnom) := nom2(1..lnom2);
    ...
    -- n’est CORRECT que si lnom = lnom2;
    ```

- Le type CHARACTER\
    Les caractères du type énuméré CHARACTER sont ordonnés.
    Pour obtenir dans une variable n, le numéro d’ordre (code ASCII) du caractère
    c, on utilisera :  
    ```ADA
    n:= CHARACTER’POS(c);
    ```
    Pour obtenir dans une variable c de type CHARACTER, le n-ième caractère
    on utilisera :
    ```ADA
    c:= CHARACTER’VAL(n);
    ```

### Exercices

1. Tester ces différentes utilisations du type STRING.

2. Raffiner et écrire un programme remplaçant dans une chaı̂ne de caractères
(chaı̂ne et longueur réelle de la chaı̂ne préalablement initialisées au clavier par
un get line) tous les ’A’ par des ’B’.

3. Raffiner et écrire en ADA un programme remplissant une chaı̂ne avec tous les
caractères d’une autre chaı̂ne qui ne sont pas des lettres (caractère entre ’a’
et ’z’).
ch = "il fait beau." de longueur lch = 13
fournit
ch2 = " ." de longueur lch2 = 3
4. Raffiner et écrire en ADA un programme éliminant d’une chaı̂ne tous les
caractères qui ne sont pas des lettres (caractère entre ’a’ et ’z’). Ne pas
oublier de mettre à jour la taille réelle !
ch = "il fait beau." de longueur lch = 13
devient
ch = "ilfaitbeau" de longueur lch = 10
Remarque : On n’utilisera pas de chaı̂ne (ou tableau) intermédiaire.
5. Reprendre le dernier exercice du sujet précédent sur les tableaux (insertion
d’une valeur) mais avec une chaine de caractères au lieu d’un tableau d’entiers.
6. Raffiner et écrire en ADA un programme conservant dans un tableau de 26
entiers max le nombre d’occurrences des lettres d’une chaı̂ne (caractère entre
’a’ et ’z’).

## TP6 : Les sous-programmes
***

> **Notions importantes à acquérir :**
> + Savoir faire la différence entre `fonction` et `procédure`.
> + Savoir écrire le contrat d’un sous-programme (en particulier : pré-conditions, post-conditions).
> + Comprendre les 3 modes de passage d’un paramètre : Donnée, Résultat, Donnée/Résultat.
> + Savoir appeler un sous-programme en respectant son contrat : test des préconditions.

1. ### Manipulation de nombres positifs binaires

Un nombre positif binaire (en base 2) est représenté sous la forme d’un tableau de 8 bits exactement, dont les valeurs seront 0 ou 1 et dont les indices vont de 0 à 7.

Par exemple le nombre `00101101` sera représenté (dans l’ordre inverse !) en mémoire par le tableau (indices de 0 à 7) :

```
indices : 0 1 2 3 4 5 6 7
valeurs : 1 0 1 1 0 1 0 0
```
et sa valeur calcul´ee par la formule : <br>
<code>
1 ∗ 2<sup>0</sup> + 0 ∗ 2<sup>1</sup> + 1 ∗ 2<sup>2</sup> + 1 ∗ 2<sup>3</sup> + 0 ∗ 2<sup>4</sup> + 1 ∗ 2<sup>5</sup> + 0 ∗ 2<sup>6</sup> + 0 ∗ 2<sup>7</sup>
</code>

Les opérations que l’on souhaite implanter sont les suivantes :
+ Affichage `a l’´ecran d’un nombre binaire (procedure)
+ Conversion en base 10 d’un nombre binaire (fonction)
+ Conversion en binaire d’un nombre en base 10 (fonction)
+ Addition de deux nombres binaires (fonction)

1. D´efinir le type `BINAIRE` associé à la représentation d’un nombre binaire sous forme d’un tableau d’entiers. Les indices iront de 0 à 7.
2. Donner les contrats de chaque sous-programme (rôle, paramètres et leur mode
de passage, pré et post conditions),
3. Ecrire un programme principal associé aux contrats précédents. On n’oubliera
pas de tenir compte des contrats des sous-programmes appelés.
4. Ecrire le code de chaque sous-programme.