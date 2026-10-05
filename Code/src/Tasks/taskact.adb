With Ada.Real_Time; use Ada.Real_Time;
With MicroBit.Console; use MicroBit.Console;
--with MicroBit.MotorDriver; use MicroBit.MotorDriver;
with MyCar;

--Important: use Microbit.IOsForTasking for controlling pins as the timer used there is implemented as an protected object
package body TaskAct is

   task body act is
      myClock : Time;      
   begin
      Setup; 
      
      loop
         myClock := Clock;
         Drive(MotorDriver.GetDirection);
         
         --Put_Line ("Direction is: " & MotorDriver.GetDirection'Image);
       
         delay until myClock + Milliseconds(50);  
         
      end loop;
   end act;
   
   procedure Setup is
   begin
     
     MotorDriver.SetDirection (Stop); -- legg til denne
   end Setup;
      
   procedure Drive (Direction : Directions) is
   begin
      case Direction is
         when Forward =>
         MyCar.Forward;
         when Stop =>
         Mycar.Stop;
         when Rotate_180_Left =>
         Mycar.Rotate_180_Left;
         when Rotate_180_right =>
         Mycar.Rotate_180_right;
         when Strafe_Right =>
         Mycar.Strafe_Right;
      end case;
   end Drive;
   
end TaskAct;
