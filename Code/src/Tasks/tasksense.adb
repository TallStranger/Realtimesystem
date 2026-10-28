With Ada.Real_Time; use Ada.Real_Time;
with Ada.Text_IO;
with LSM303AGR;
with MicroBit.Console;
With MicroBit.Ultrasonic; 
with MicroBit; use MicroBit;
with Ada.Execution_Time; use Ada.Execution_Time;
with MicroBit.Accelerometer;
with MicroBit.Buttons; use MicroBit.Buttons;

package body TaskSense is

   package Sensor_Left is new Ultrasonic(MB_P14, MB_P1);
   package Sensor_Front is new Ultrasonic(MB_P16, MB_P0);
   package Sensor_Right is new Ultrasonic(MB_P13, MB_P2);
    task body sense is
      myClock : Time;
      time_now : Time_Span;
      Raw_Y : Integer;
      Previous_Raw_Y : Integer := 0;
      Delta_Y : Integer;
      Average_Delta : Float := 0.0;
      Previous_Average_Delta : Float := 0.0;
   begin    
      loop
         myClock := Clock; 
         if MicroBit.Buttons.State (Button_A) = Pressed then
            Brain.SetMode(Normal_Mode);               
         elsif MicroBit.Buttons.State (Button_B) = Pressed then
            Brain.SetMode(Chaos_Mode);
         end if;
         declare
            Distance_Front : Integer := Integer(Sensor_Front.Read);
            Distance_Left : Integer := Integer(Sensor_Left.Read);
            Distance_Right : Integer := Integer(Sensor_Right.Read);
            Data : LSM303AGR.All_Axes_Data;
         begin 
         Brain.SetMeasurementSensorFront (Distance_Front); 
         Brain.SetMeasurementSensorLeft (Distance_Left);
         Brain.SetMeasurementSensorRight (Distance_Right);
         Data := Microbit.Accelerometer.AccelData;
         Raw_Y := Integer(Data.X);

            Delta_Y := abs(Raw_Y - Previous_Raw_Y);

            Previous_Raw_Y := Raw_Y;

            Average_Delta :=
               0.4 * Float(Delta_Y)
               + 0.6 * Previous_Average_Delta;
            Previous_Average_Delta := Average_Delta;
            Brain.SetAccelVal (Integer(Average_Delta));

            --MicroBit.Console.Put_Line(
           -- "Raw=" & Raw_Y'Image &
           -- " Delta=" & Delta_Y'Image &
           -- " Avarage Delta= " & Integer(Average_Delta)'Image);     
         
         --MicroBit.Console.Put_Line("Raw data Y: " & Data_X'Image);
         --MicroBit.Console.Put_Line("Y koordinater" & Data.Y'Img);
         MicroBit.Console.Put_Line("Right sensor" & Distance_Right'image);
        MicroBit.Console.Put_Line ("Left sensor" & Distance_Left'Image);
        MicroBit.Console.Put_Line ("Front sensor" & Distance_Front'Image);
         
         end;
         time_now := Clock - myClock; 
         MicroBit.Console.Put_Line("Tasksense" & To_Duration(time_now)'Image);

         delay until myClock + Milliseconds(200); --random period
         
      end loop;
   end sense;

end TaskSense;
