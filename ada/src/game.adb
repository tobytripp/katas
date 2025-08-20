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
      Roll_Idx : Positive := 1;
   begin
      for Frame in 1 .. 10 loop
         exit when Roll_Idx > Roll_Index;
         
         if Frame < 10 then
            -- Regular frames (1-9)
            if Roll_Idx + 1 <= Roll_Index and then 
               Rolls(Roll_Idx) + Rolls(Roll_Idx + 1) = 10 then
               -- Spare: add 10 plus next roll as bonus
               Total := Total + 10;
               if Roll_Idx + 2 <= Roll_Index then
                  Total := Total + Score_Value(Rolls(Roll_Idx + 2));
               end if;
               Roll_Idx := Roll_Idx + 2;
            else
               -- Regular scoring
               Total := Total + Score_Value(Rolls(Roll_Idx));
               if Roll_Idx + 1 <= Roll_Index then
                  Total := Total + Score_Value(Rolls(Roll_Idx + 1));
               end if;
               Roll_Idx := Roll_Idx + 2;
            end if;
         else
            -- 10th frame - add all remaining rolls
            while Roll_Idx <= Roll_Index loop
               Total := Total + Score_Value(Rolls(Roll_Idx));
               Roll_Idx := Roll_Idx + 1;
            end loop;
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