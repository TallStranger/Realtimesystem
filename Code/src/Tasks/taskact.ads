with MyMotorDriver; use MyMotorDriver;
with MyBrain; use MyBrain;

package TaskAct is

   task Act with Priority=> 4;

   procedure Setup;    
   procedure Drive (direction : Directions);
   procedure Update_Display;
end TaskAct;
