With Ada.Real_Time; use Ada.Real_Time;
With MicroBit.Console; use MicroBit.Console;
--with MicroBit.MotorDriver; use MicroBit.MotorDriver;
with MyCar;

--Important: use Microbit.IOsForTasking for controlling pins as the timer used there is implemented as an protected object
package body TaskAct is

   task body act is
      myClock : Time;      
   begin
      Setup; -- we do Setup once at the start of the task;
      
      loop
         myClock := Clock;
         Drive(MotorDriver.GetDirection);
         
         --Put_Line ("Direction is: " & MotorDriver.GetDirection'Image);
       
         delay until myClock + Milliseconds(50);  --random period, but faster than 20 ms is no use because Set_Analog_Period_Us(20000) !
                                                 --faster is better but note the weakest link: if decisions in the thinking task come at 100ms and acting come at 20ms 
                                                  --then no change is set in the acting task for at least 5x (and is wasting power to wake up and execute task!)
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
         Put_Line ("Rotate left");
         Mycar.Rotate_180_Left;
      end case;
   end Drive;
   
end TaskAct;
