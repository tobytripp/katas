package body Game is

   procedure Roll (Pins : out Roll_Result) is
   begin
      Pins := 0;
   end Roll;

   function Score return Score_Value is
   begin
      return 0;
   end Score;

   procedure Reset_Game is
   begin
      null;
   end Reset_Game;

end Game;