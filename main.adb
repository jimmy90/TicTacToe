With Ada.Text_Io,Ada.Integer_Text_IO;USE Ada.Text_IO,Ada.Integer_Text_IO;
with Cellules; 
with Grille; 
With Jeu;
procedure main is 
	a:integer;
begin
	Put_Line("Choisissez le nombre de joueur");
	loop --Une boucle afin que le joueur puisse ressaisir un nombre correct de joueur au cas oû il se tromperait.
		Get(A);
		if a=1 then
			Put_Line("L'IA est en cours de construction");
			exit;  -- Il sort prématurement de la boucle si et seulement si il tape un nombre correct
		else if a=2 then 
				Put_Line("Le jeu commence");
				Skip_line; --Je vide le buffer d'entrée sortie avant d'appeller la procédure Jeu
					-- sinon l'entier designant le nombre de joueur sera compter au lancement comme une mauvaise colonne.
				Jeu;
				exit; -- Il sort prématurement de la boucle si et seulement si il tape un nombre correct
			else Put_Line ("Mauvais argument, choisissez un bon nombre svp entre 1 et 2");
			end if;
		end if;
	end loop;
end main;

--Attention les exceptions ne sont pas totalement gerées par ex le cas ol'utilisateur ne saisit pas un entier
