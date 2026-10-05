With Ada.Real_Time; use Ada.Real_Time;
With MicroBit.Console; use MicroBit.Console;
--with MicroBit.MotorDriver; use MicroBit.MotorDriver;
with MyCar;
with Microbit.Servos; use MicroBit.Servos;

--Important: use Microbit.IOsForTasking for controlling pins as the timer used there is implemented as an protected object
package body TaskAct is

   task body act is
      myClock : Time;      
      now_time : Time_Span;
   begin
      Setup; 
      
      loop
         myClock := Clock;
         Drive(MotorDriver.GetDirection);
         
         now_time := Clock - myClock;
         MicroBit.Console.Put_Line("Taskact" & To_Duration(now_time)'Image);
         delay until myClock + Milliseconds(50);  
         
      end loop;
   end act;
   
   procedure Setup is
   begin
     
     MotorDriver.SetDirection (Stop); 
   end Setup;
      
   procedure Drive (Direction : Directions) is
   begin
      case Direction is
         when Forward =>
         MyCar.Forward;
         when Stop =>
         Mycar.Stop;
         when Rotate_Left =>
         Mycar.Rotate_Left;
         when Rotate_right =>
         Mycar.Rotate_right;
         when Strafe_Right =>
         Mycar.Strafe_Right;
         when Strafe_Left =>
         Mycar.Strafe_Left;
         when Backward =>
         Mycar.Backward;
      end case;
   end Drive;
   
end TaskAct;
