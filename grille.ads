with Cellules; 
package Grille is 
   subtype Ligne is Character range '1' .. '3'; 
   subtype Colonne  is Character range 'A' .. 'C'; 
   type grille is private; 
  function IsEmpty (Un_Plateau : grille; X : colonne; Y : ligne) return Boolean; 
 function IsNotEmpty (Un_Plateau : grille; X : Colonne; Y : Ligne) return Cellules.Symbole; 
   function TakenBy (Un_Plateau : grille; X : Colonne; Y : Ligne; Un_Symbole : Cellules.Symbole) return Boolean; 
   procedure Tracer (Un_Plateau : in out grille; X : in Colonne; Y : in Ligne; Un_Symbole : in Cellules.Symbole); 
   function Tester  (Un_Plateau : grille; X : Colonne; Y : Ligne; Un_Symbole : in Cellules.Symbole) return Boolean; 
   function IsFull  (Un_Plateau : grille) return Boolean; 
private 
   type Contenu is array (Ligne, Colonne) of Cellules.Cellule; 
   subtype Numero_Coup is Natural range 0 .. 9; 
  type grille is record 
     Nombre_Coups : Numero_Coup := 0; 
      Un_Contenu : Contenu; 
   end record; 
end Grille; 

