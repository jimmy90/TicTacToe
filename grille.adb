package body Grille is 
  
 	--Verifie si la cellule de coordonnées (X,Y) de la grille est vide
   function IsEmpty (Un_Plateau : grille;  X : colonne; Y : ligne)  return Boolean is 
   begin 
      return Cellules.IsEmpty (Un_Plateau.Un_Contenu (Y, X)); 
   end IsEmpty; 
 
 	--Verifie si la cellule de coordonnées (X,Y) de la grille n'est pas vide
   function IsNotEmpty (Un_Plateau : grille; X : Colonne; Y : Ligne) return cellules.Symbole is 
   begin 
      return Cellules.IsNotEmpty (Un_Plateau.Un_Contenu (Y, X)); 
   end IsNotEmpty; 
 
 	--Verifie si la cellule de coordonnées (X,Y) de la grille est occupée par le symbole 'Un_symbole'
   function TakenBy(Un_Plateau : grille; X : Colonne; Y : Ligne; Un_Symbole : Cellules.Symbole) return Boolean is 
      function "=" (X, Y : Cellules.Symbole) return Boolean renames Cellules."="; 
   begin 
      return (not Cellules.IsEmpty(Un_Plateau.Un_Contenu (Y, X))) and then (Cellules.IsNotEmpty(Un_Plateau.Un_Contenu (Y, X))= Un_Symbole); 
   end TakenBy; 
 
   	----Essaye de placer le symbole 'Un_symbole' dans la cellule de coordonées (Y,X) de la grille
   procedure Tracer (Un_Plateau : in out grille; X : in Colonne; Y : in Ligne; Un_Symbole : in Cellules.Symbole) is 
   begin 
      Cellules.Tracer (Un_Plateau.Un_Contenu (Y, X), Un_Symbole); 
      Un_Plateau.Nombre_Coups := Un_Plateau.Nombre_Coups + 1; 
   end Tracer; 
 
   	--À expliquer
   function Voisin_Colonne (X : Colonne) return Colonne is 
   begin 
      if X = Colonne'Last then return Colonne'First; 
      else return Colonne'Succ (X); end if; 
   end Voisin_Colonne; 
 
   function Voisin_Ligne (Y : Ligne) return Ligne is 
   begin 
      if Y = ligne'Last then return ligne'First; 
      else return Ligne'Succ (Y); end if; 
   end Voisin_Ligne;
 
   function Tester (Un_Plateau : grille; X : Colonne; Y : Ligne; Un_Symbole : in Cellules.Symbole) return Boolean is 
      function Voisin_Colonne (X : Colonne) return Colonne is 
      begin 
         if X = Colonne'Last then return Colonne'First; 
         else return Colonne'Succ (X); end if; 
      end Voisin_Colonne; 
 
      function Voisin_Ligne (Y : Ligne) return Ligne is 
      begin 
         if Y = Ligne'Last then return Ligne'First; 
         else return Ligne'Succ (Y); end if; 
      end Voisin_Ligne; 
      function "=" (X, Y : Cellules.Symbole) return boolean renames cellules."="; 
      use Cellules; 
   begin 
      return 
        (TakenBy (Un_Plateau, Voisin_Colonne (X), Y, Un_Symbole) 
         and then 
          TakenBy (Un_Plateau, Voisin_Colonne (Voisin_Colonne (X)), Y, Un_Symbole)) 
        or else 
          (TakenBy (Un_Plateau, X, Voisin_Ligne (Y), Un_Symbole) 
            and then 
             TakenBy (Un_Plateau, X, Voisin_Ligne (Voisin_Ligne (Y)), Un_Symbole)) 
        or else 
          ((abs (Colonne'Pos (X) - Ligne'Pos (Y)) /= 1) and then 
             TakenBy (Un_Plateau, Voisin_Colonne (X), Voisin_Ligne (Y), Un_Symbole) and then 
             TakenBy (Un_Plateau, Voisin_Colonne (Voisin_Colonne (X)), Voisin_Ligne (Voisin_Ligne (Y)), Un_Symbole)); 
   end Tester; 
 
   
 	--Verifie si la grille est pleine c'est à dire si les 9 coups ont étés joués
   function IsFull (Un_Plateau : grille) return Boolean is 
   begin 
      return Un_Plateau.Nombre_Coups = Numero_Coup'Last; 
   end IsFull; 
 
end Grille; 

