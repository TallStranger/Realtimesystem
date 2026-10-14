with MyMotorDriver; use MyMotorDriver;

package TaskAct is

   task Act with Priority=> 4;

   procedure Setup;    
   procedure Drive (direction : Directions);
end TaskAct;
