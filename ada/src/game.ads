package Game is

   type Roll_Result is range 0 .. 10;
   type Score_Value is range 0 .. 300;

   procedure Roll (Pins : in Roll_Result);
   function Score return Score_Value;
   procedure Reset_Game;

end Game;