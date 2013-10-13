with Ada.Text_IO;
with Cellules;
with Grille;
procedure jeu is
   Un_Plateau : Grille.grille;
   Quel : Cellules.Symbole;
   procedure Afficher is
      function Image (Un_Symbole : Cellules.Symbole) return Character is
         S : constant String (1 .. 3) := Cellules.Symbole'Image (Un_Symbole);
      begin  return S (2); end;
   begin
      for Y in reverse Grille.Ligne loop
         Ada.Text_IO.Put (Y);
         for X in Grille.Colonne loop
            Ada.Text_IO.Put ("|");
            if Grille.IsEmpty (Un_Plateau, X, Y) then
               Ada.Text_IO.Put ("   |");
            else
               Ada.Text_IO.Put (" "&Image (Grille.IsNotEmpty (Un_Plateau, X, Y))&" |");
            end if;
         end loop;
         ada.Text_IO.New_Line;
      end loop;
      Ada.Text_IO.New_Line;
      Ada.Text_IO.Put ("  "); for X in Grille.Colonne loop Ada.Text_IO.Put (' '); Ada.Text_IO.Put (" "&X&" "); end loop; Ada.Text_IO.New_Line;
   end Afficher;
begin
   loop
      begin
         Ada.Text_Io.Put ("Qui debute ? (X) ou (O) "); Quel := Cellules.Symbole'Value (''' & Ada.Text_Io.Get_Line & '''); exit;
      exception
         when others => Ada.Text_Io.Put_Line ("Symbole inconnue, Rejouez svp");
      end;
   end loop;
   loop
      Afficher;
      if Grille.IsFull (Un_Plateau) then
         Ada.Text_Io.Put_Line (" Partie termine :EGALITE "); exit;
      else
         Ada.Text_IO.Put_Line (Cellules.Symbole'Image (Quel) & " joue.");
         declare
            X : Grille.Colonne;
            Y : Grille.Ligne;
         begin
            loop
               begin
                  Ada.Text_Io.Put ("colonne   ? "); Ada.Text_Io.Get (X); Ada.Text_Io.Skip_Line; exit;
               exception
                  when others =>
                     Ada.Text_Io.Put_Line ("Mauvaise colonne, Rejouez svp");
               end;
            end loop;
            loop
               begin
                  Ada.Text_Io.Put ("ligne     ? "); Ada.Text_Io.Get (Y); Ada.Text_Io.Skip_Line; exit;
               exception
                  when others =>
                     Ada.Text_Io.Put_Line ("Mauvaise ligne, Rejouez svp");
               end;
            end loop;
            if not Grille.IsEmpty (Un_Plateau => un_plateau,
                                   X          => x,
                                   Y          => Y) then
               Ada.Text_Io.Put_Line (" La place est prise, Rejouez svp");
            elsif Grille.Tester (Un_Plateau => un_plateau,
                                   X          => X,
                                   Y          => Y,
                                   Un_Symbole => Quel) then
               Grille.Tracer (Un_Plateau => un_plateau,
                                X          => X,
                                Y          => Y,
                                Un_Symbole => Quel);
               Afficher;
               Ada.Text_Io.Put_Line ("Partie termine: "&cellules.symbole'Image (quel) & " VAINQUEUR ");
               exit;
            else
               Grille.Tracer (Un_Plateau => un_plateau,
                                X          => X,
                                Y          => Y,
                                Un_Symbole => Quel);
               Quel := cellules.Suivant (Quel);
            end if;
         end;
      end if;
   end loop;
end jeu;

