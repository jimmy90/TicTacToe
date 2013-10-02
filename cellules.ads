package Cellules is 
   	subtype Colonne  is Character range 'A' .. 'C'; 
   	subtype Ligne is Character range '1' .. '3'; 
   	type Symbole is ('O', 'X'); 
   	Suivant : constant array (Cellules.Symbole) of Cellules.Symbole := ('O' => 'X', 'X' => 'O'); 
   	type Cellule is private; 
   -- Fonction evaluant si une cellule est vide
function IsEmpty(cel : Cellule) return Boolean; 

	cel_empty : exception; 
   
-- Fonction evaluant si une cellule est non vide
function IsNotEmpty(cel : Cellule) return Symbole;
   
	cel_not_empty : exception;   
 procedure Tracer ( cel : in out Cellule; symb : in Symbole ); 

private 
	type Cellule (occupee: Boolean := False) is record 
      		case occupee is 
      		when False => null; 
      		when true => symb : Symbole;
      		end case; 
   	end record; 
end Cellules ; 
