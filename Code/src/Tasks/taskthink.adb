With Ada.Real_Time; use Ada.Real_Time;
with MyCar;

package body TaskThink is

  task body think is
   myClock : Time;
   begin
      loop
         myClock := Clock;
        
         if Brain.GetMeasurementSensor1 < 10 and Brain.GetMeasurementSensorRight < 10 then            
            MotorDriver.SetDirection (Rotate_180_Left);      
         elsif Brain.GetMeasurementSensor1 < 10  then
            MotorDriver.SetDirection (Stop);
         else
            MotorDriver.SetDirection (Forward); 
         end if;
         delay until myClock + Milliseconds(100);  --random period
      end loop;
   end think;


end TaskThink;
