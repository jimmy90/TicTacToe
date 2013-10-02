package body Cellules is 
 --Le type cellules est un article composé de 2 variables : occupee(boolean) & symb(symbole)
	--Verifie que la cellule 'cel' est bel et bien vide 
   function IsEmpty(cel : Cellule) return Boolean is 
   begin 
      return not cel.Occupee; 
   end IsEmpty; 
 	--Verifie que la cellule 'cel' n'est pas vide 
   function IsNotEmpty(cel : Cellule) return Symbole is 
   begin 
      if cel.Occupee then return cel.symb; 
      else raise cel_empty; end if; 
   end IsNotEmpty; 
 	--Essaye de placer un symbole dans la cellule 'cel' 
		--Si la cellule est occupée le pg lance une exception sinon le symbole est placé, la variable 'occupee' de 'cel'passe à true
   procedure Tracer (cel : in out Cellule; symb : in Symbole) is 
   begin 
      if  cel.Occupee then raise cel_not_empty; 
      else cel := (Occupee => True, symb => symb); end if; 
   end Tracer; 
 
end Cellules; 

