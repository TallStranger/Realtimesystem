With Ada.Real_Time; use Ada.Real_Time;
with MyCar;

package body TaskThink is

  task body think is
   myClock : Time;
   type States is (
      Forward_State,
      Stop_State,
      Rotate_Left_State,
      Rotate_Right_State,
      Strafe_Right_State
   );
   Current_State : States := Forward_State;
   begin
      loop
         myClock := Clock;
        
        case Current_State is 
         when Forward_State =>
         MotorDriver.SetDirection (Forward);
            if Brain.GetMeasurementSensorFront < 10 and Brain.GetMeasurementSensorRight < 10 then
               Current_State := Rotate_Left_State;
            elsif Brain.GetMeasurementSensorFront < 10 and Brain.GetMeasurementSensorLeft < 10 then
               Current_State := Rotate_Right_State;
            elsif Brain.GetMeasurementSensorLeft <10 then 
               Current_State := Strafe_Right_State;
            end if;
         when Rotate_Left_State => 
            MotorDriver.SetDirection (Rotate_180_Left);
               if Brain.GetMeasurementSensorFront > 10 then 
                  Current_State := Forward_State;
               end if;
         when Rotate_Right_State =>
            MotorDriver.SetDirection (Rotate_180_right);
               if Brain.GetMeasurementSensorFront > 10 then
                  Current_State := Forward_State;
               end if;
         when Stop_State =>
            MotorDriver.SetDirection (Stop);
         when Strafe_Right_State =>
            MotorDriver.SetDirection (Strafe_Right);
            if Brain.GetMeasurementSensorLeft > 20 then 
               Current_State := Forward_State;
            end if;
         end case;
         
         delay until myClock + Milliseconds(100);  --random period
      end loop;
   end think;


end TaskThink;
