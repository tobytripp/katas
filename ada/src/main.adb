with Ada.Text_IO;
with Game;

procedure Main is
   Current_Score : Game.Score_Value;
begin
   Ada.Text_IO.Put_Line("Ada Bowling Game");
   
   -- Test the Game package
   Game.Roll (3);
   Ada.Text_IO.Put_Line("Rolled: 3");
   
   Current_Score := Game.Score;
   Ada.Text_IO.Put_Line("Score: " & Game.Score_Value'Image(Current_Score));
end Main;