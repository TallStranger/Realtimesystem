With Ada.Real_Time; use Ada.Real_Time;
with MicroBit.Console;
with MyCar;
with Ada.Execution_Time; use Ada.Execution_Time;
with MicroBit.Console;

package body TaskThink is

  task body think is
   myClock : Time;
   current_time : Time_Span;
   Front : Integer;
   Left : Integer;
   Right : Integer;
   type States is (
      Forward_State,
      Stop_State,
      Rotate_Left_State,
      Rotate_Right_State,
      Strafe_Right_State,
      Strafe_Left_State,
      Reverse_State
   );
   Current_State : States := Forward_State;
   begin
      loop
         myClock := Clock;
        
        Front := Brain.GetMeasurementSensorFront;
        Left := Brain.GetMeasurementSensorLeft;
        Right := Brain.GetMeasurementSensorRight;

        case Current_State is 
         when Forward_State =>
         MotorDriver.SetDirection (Forward);
            --if Front < 10 and Right < 10 then
               --Current_State := Rotate_Left_State;
            --elsif Front < 10 and Left < 10 then
               --Current_State := Rotate_Right_State;
            if Left <10 then 
               Current_State := Strafe_Right_State;
            elsif Right < 10 then
               Current_State := Strafe_Left_State;
            elsif Front < 10 then
               if right > 20 then 
                  Current_State :=Rotate_Right_State;
               elsif Left > 20 then 
                  Current_State := Rotate_Left_State;
               else 
                  Current_State := Reverse_State;
               end if;
            end if;
         when Rotate_Left_State => 
            MotorDriver.SetDirection (Rotate_Left);
               if Front > 30 then 
                  Current_State := Forward_State;
               end if;
         when Rotate_Right_State =>
            MotorDriver.SetDirection (Rotate_right);
               if Front > 30 then
                  Current_State := Forward_State;
               end if;
         when Stop_State =>
            MotorDriver.SetDirection (Stop);
            if Front > 20 then
               Current_State := Forward_State;
            end if;
         when Strafe_Right_State =>
            MotorDriver.SetDirection (Strafe_Right);
            if Left > 20 then 
               Current_State := Forward_State;
            end if;
         when Strafe_Left_State =>
            MotorDriver.SetDirection (Strafe_Left);
            if Right > 20 then
               Current_State := Forward_State;
            end if;
         when Reverse_State =>
            MotorDriver.SetDirection (Backward);
            if Front > 30 then
               Current_State := Forward_State;
            end if;
         end case;
         current_time := Clock - myClock;
         MicroBit.Console.Put_Line("Taskthink" & To_Duration(current_time)'Image);
         delay until myClock + Milliseconds(100);  --random period
      end loop;
   end think;


end TaskThink;
