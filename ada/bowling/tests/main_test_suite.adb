with Main_Test;
with Game_Test;

package body Main_Test_Suite is

   function Suite return Access_Test_Suite is
      Result : constant Access_Test_Suite := new Test_Suite;
   begin
      Add_Test (Result, new Main_Test.Test_Case);
      Add_Test (Result, new Game_Test.Test_Case);
      return Result;
   end Suite;

end Main_Test_Suite;