with Ada.Real_Time; use Ada.Real_Time;

with Car_Types;
use Car_Types;

with Control_Data;
with MicroBit;
with MicroBit.Console;
with MyCar;

package body Motor_Task is

   task body Motor_Controller is

      Period : constant Time_Span :=
         Milliseconds (20);

      Next_Time : Time := Clock;

      Desired_Action : Action_Type;

   begin

      loop

         Desired_Action :=
            Control_Data.Command_Buffer.Get_Action;

         case Desired_Action is
            when Forward =>
               MyCar.Forward;

            when Backward =>
               MyCar.Backward;
            
            when Rotate_Left =>
               Mycar.Rotate_Left;
            
            when Rotate_Right => 
               Mycar.Rotate_Right;
            
            when Stop =>
               Mycar.Stop;
            
            when Rotate_180_Left =>
               MyCar.Rotate_180_Left;
         end case;

         Next_Time := Next_Time + Period;
         delay until Next_Time;

      end loop;

   end Motor_Controller;

end Motor_Task;