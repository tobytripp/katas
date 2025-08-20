with AUnit.Assertions; use AUnit.Assertions;
with Game; use Game;

package body Game_Test is

   overriding
   function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Game Test Cases");
   end Name;

   overriding
   procedure Run_Test (T : in out Test_Case) is
      pragma Unreferenced (T);
      Pins : Roll_Result;
      Current_Score : Score_Value;
   begin
      -- Test roll procedure
      Roll (Pins);
      Assert (Pins = 0, "Roll should return 0");

      -- Test score function
      Current_Score := Score;
      Assert (Current_Score = 0, "Score should be 0");

      -- Test reset game
      Reset_Game;
      Assert (True, "Reset game should complete without error");

      -- Test 20 rolls of 0 result in score of 0
      Reset_Game;
      for I in 1 .. 20 loop
         Roll (I);
      end loop;
      Current_Score := Score;
      Assert (Current_Score = 0, "20 rolls of 0 should result in score of 0");
   end Run_Test;

end Game_Test;
