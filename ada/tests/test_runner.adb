with AUnit.Run;
with AUnit.Reporter.Text;
with Main_Test_Suite;

procedure Test_Runner is
   procedure Run is new AUnit.Run.Test_Runner (Main_Test_Suite.Suite);
   Reporter : AUnit.Reporter.Text.Text_Reporter;
begin
   Run (Reporter);
end Test_Runner;