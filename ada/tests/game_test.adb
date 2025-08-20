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
      Current_Score : Score_Value;
   begin
      -- Test score function
      Current_Score := Score;
      Assert (Current_Score = 0, "Score should be 0");

      -- Test reset game
      Reset_Game;
      Assert (True, "Reset game should complete without error");

      -- Test 20 rolls of 0 result in score of 0
      Reset_Game;
      for I in 1 .. 20 loop
         Roll (0);
      end loop;
      Current_Score := Score;
      Assert (Current_Score = 0, "20 rolls of 0 should result in score of 0");
      
      -- Test rolling all ones gives score of 20
      Reset_Game;
      for I in 1 .. 20 loop
         Roll (1);
      end loop;
      Current_Score := Score;
      Assert (Current_Score = 20, "20 rolls of 1 should result in score of 20");
      
      -- Test spare: 5,5,3 + 17 zeroes should score 16
      Reset_Game;
      Roll (5);
      Roll (5);
      Roll (3);
      for I in 1 .. 17 loop
         Roll (0);
      end loop;
      Current_Score := Score;
      Assert (Current_Score = 16, "Spare 5,5,3 + 17 zeroes should score 16");
      
      -- Test rolling 5 twenty-one times should score 150
      Reset_Game;
      for I in 1 .. 21 loop
         Roll (5);
      end loop;
      Current_Score := Score;
      Assert (Current_Score = 150, "Rolling 5 twenty-one times should score 150");
      
      -- Test strike: 10,3,4 + 16 zeroes should score 24
      Reset_Game;
      Roll (10);
      Roll (3);
      Roll (4);
      for I in 1 .. 16 loop
         Roll (0);
      end loop;
      Current_Score := Score;
      Assert (Current_Score = 24, "Strike 10,3,4 + 16 zeroes should score 24");
      
      -- Test 10 spares (8,2) + final 3 should score 175
      Reset_Game;
      for I in 1 .. 10 loop
         Roll (8);
         Roll (2);
      end loop;
      Roll (3);  -- Bonus roll for 10th frame spare
      Current_Score := Score;
      Assert (Current_Score = 175, "10 spares (8,2) + final 3 should score 175");
      
      -- Test perfect game: 12 tens should score 300
      Reset_Game;
      for I in 1 .. 12 loop
         Roll (10);
      end loop;
      Current_Score := Score;
      Assert (Current_Score = 300, "Perfect game: 12 tens should score 300");
   end Run_Test;

end Game_Test;
