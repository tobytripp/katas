with AUnit;
with AUnit.Simple_Test_Cases;

package Game_Test is

   type Test_Case is new AUnit.Simple_Test_Cases.Test_Case with null record;

   overriding
   function Name (T : Test_Case) return AUnit.Message_String;

   overriding
   procedure Run_Test (T : in out Test_Case);

end Game_Test;