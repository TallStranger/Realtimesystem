With Ada.Real_Time; use Ada.Real_Time;
with Ada.Text_IO;
with MicroBit.Console;
With MicroBit.Ultrasonic; 
with MicroBit; use MicroBit;
with Ada.Execution_Time; use Ada.Execution_Time;

package body TaskSense is

   package Sensor_Left is new Ultrasonic(MB_P14, MB_P1);
   package Sensor_Front is new Ultrasonic(MB_P16, MB_P0);
   package Sensor_Right is new Ultrasonic(MB_P13, MB_P2);
    task body sense is
      myClock : Time;
      time_now : Time_Span;


   begin
      
      MicroBit.Console.Put_Line ("Sense started");
      
      loop
         myClock := Clock; 
                        
         
         declare
            Distance_Front : Integer := Integer(Sensor_Front.Read);
            Distance_Left : Integer := Integer(Sensor_Left.Read);
            Distance_Right : Integer := Integer(Sensor_Right.Read);
         begin 
            --MicroBit.Console.Put_Line ("Distance Front: " & Integer'Image(Distance_Front));
            --MicroBit.Console.Put_Line ("Distance Left: " & Integer'Image(Distance_Left));
            --MicroBit.Console.Put_Line ("Distance Right: " & Integer'Image(Distance_Right));

         Brain.SetMeasurementSensor1 (Distance_Front); 
         Brain.SetMeasurementSensor2 (Distance_Left);
         Brain.SetMeasurementSensorRight (Distance_Right);
         end;
         time_now := Clock - myClock; 
         MicroBit.Console.Put_Line(To_Duration(time_now)'Image);

         delay until myClock + Milliseconds(200); --random period
         
      end loop;
   end sense;

end TaskSense;
