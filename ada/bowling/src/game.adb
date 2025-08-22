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

   function Get_Roll(Index : Positive) return Roll_Result is
   begin
      if Index <= Roll_Index then
         return Rolls(Index);
      else
         return 0;
      end if;
   end Get_Roll;

   function Is_Strike(Roll_Idx : Positive) return Boolean is
   begin
      return Get_Roll(Roll_Idx) = 10;
   end Is_Strike;

   function Is_Spare(Roll_Idx : Positive) return Boolean is
   begin
      return Get_Roll(Roll_Idx) + Get_Roll(Roll_Idx + 1) = 10;
   end Is_Spare;

   function Score_Strike(Roll_Idx : Positive) return Score_Value is
   begin
      return 10 + Score_Value(Get_Roll(Roll_Idx + 1)) + Score_Value(Get_Roll(Roll_Idx + 2));
   end Score_Strike;

   function Score_Spare(Roll_Idx : Positive) return Score_Value is
   begin
      return 10 + Score_Value(Get_Roll(Roll_Idx + 2));
   end Score_Spare;

   function Score_Regular(Roll_Idx : Positive) return Score_Value is
   begin
      return Score_Value(Get_Roll(Roll_Idx)) + Score_Value(Get_Roll(Roll_Idx + 1));
   end Score_Regular;

   function Score_Regular_Frame(Roll_Idx : in out Positive) return Score_Value is
      Frame_Score : Score_Value;
   begin
      if Is_Strike(Roll_Idx) then
         Frame_Score := Score_Strike(Roll_Idx);
         Roll_Idx := Roll_Idx + 1;
      elsif Is_Spare(Roll_Idx) then
         Frame_Score := Score_Spare(Roll_Idx);
         Roll_Idx := Roll_Idx + 2;
      else
         Frame_Score := Score_Regular(Roll_Idx);
         Roll_Idx := Roll_Idx + 2;
      end if;
      return Frame_Score;
   end Score_Regular_Frame;

   function Score_Tenth_Frame(Roll_Idx : Positive) return Score_Value is
      Frame_Score : Score_Value := 0;
      Current_Idx : Positive := Roll_Idx;
   begin
      while Current_Idx <= Roll_Index loop
         Frame_Score := Frame_Score + Score_Value(Get_Roll(Current_Idx));
         Current_Idx := Current_Idx + 1;
      end loop;
      return Frame_Score;
   end Score_Tenth_Frame;

   function Score return Score_Value is
      Total : Score_Value := 0;
      Roll_Idx : Positive := 1;
   begin
      for Frame in 1 .. 10 loop
         exit when Roll_Idx > Roll_Index;
         
         if Frame < 10 then
            Total := Total + Score_Regular_Frame(Roll_Idx);
         else
            Total := Total + Score_Tenth_Frame(Roll_Idx);
            exit;
         end if;
      end loop;
      
      return Total;
   end Score;

   procedure Reset_Game is
   begin
      Rolls := (others => 0);
      Roll_Index := 0;
   end Reset_Game;

end Game;