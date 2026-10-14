With Ada.Real_Time; use Ada.Real_Time;
With MicroBit.Console; use MicroBit.Console;
--with MicroBit.MotorDriver; use MicroBit.MotorDriver;
with MyBrain;
with MyCar;
with Microbit.Servos; use MicroBit.Servos;
with MicroBit.Music; use MicroBit.Music;
with MicroBit.DisplayRT;
with MicroBit.DisplayRT.Symbols;

package body TaskAct is

   task body act is
      myClock : Time;      
      now_time : Time_Span;
   begin
      Setup; 
      
      loop
         myClock := Clock;
         Drive(MotorDriver.GetDirection);
        
         Update_Display;

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
   case Brain.GetMode is 
   when Normal_Mode =>
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
   when Chaos_Mode =>
      case Direction is
         when Forward =>
         MyCar.Forward;
         when Stop =>
         Mycar.Forward;
         when Rotate_Left =>
         Mycar.Rotate_Right;
         when Rotate_right =>
         Mycar.Rotate_Left;
         when Strafe_Right =>
         Mycar.Strafe_left;
         when Strafe_Left =>
         Mycar.Strafe_right;
         when Backward =>
         Mycar.Forward;
      end case;
   end case;
   end Drive;

   procedure Update_Display is
   begin

      case Brain.GetMode is

         when Normal_Mode =>
            MicroBit.DisplayRT.Clear;
            MicroBit.DisplayRT.Symbols.Smile;

         when Chaos_Mode =>
            MicroBit.DisplayRT.Clear;
            MicroBit.DisplayRT.Symbols.Frown;

      end case;

end Update_Display;
   
end TaskAct;
