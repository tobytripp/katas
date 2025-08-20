package body Game is

   Rolls : array (1 .. 21) of Roll_Result := (others => 0);
   Roll_Index : Natural := 0;

   procedure Roll (Pins : in Roll_Result) is
   begin
      if Roll_Index < Rolls'Last then
         Roll_Index := Roll_Index + 1;
         Rolls (Roll_Index) := Pins;
      end if;
   end Roll;

   function Score return Score_Value is
      Total : Score_Value := 0;
   begin
      for I in 1 .. Roll_Index loop
         Total := Total + Score_Value(Rolls(I));
      end loop;
      return Total;
   end Score;

   procedure Reset_Game is
   begin
      Rolls := (others => 0);
      Roll_Index := 0;
   end Reset_Game;

end Game;