with Ada.Text_IO;
with Game;

procedure Main is
   Pins : Game.Roll_Result;
   Current_Score : Game.Score_Value;
begin
   Ada.Text_IO.Put_Line("Ada Bowling Game");
   
   -- Test the Game package
   Game.Roll (Pins);
   Ada.Text_IO.Put_Line("Rolled: " & Game.Roll_Result'Image(Pins));
   
   Current_Score := Game.Score;
   Ada.Text_IO.Put_Line("Score: " & Game.Score_Value'Image(Current_Score));
end Main;