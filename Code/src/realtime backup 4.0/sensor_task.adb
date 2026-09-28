with Ada.Real_Time; use Ada.Real_Time;

with MicroBit.Console;
with MicroBit.Ultrasonic;
with MicroBit.Types; use MicroBit.Types;
use MicroBit;

with Sensor_Data;

package body Sensor_Task is

   package Sensor_Front is new Ultrasonic (MB_P16, MB_P0);
   package Sensor_Left is new Ultrasonic (MB_P14, MB_P1);
   --package Sensor_Right is new Ultrasonic(MB_P13, MB_P2);

   task body Sensors is

      Period : constant Time_Span := Milliseconds (50);
      Next_Time : Time := Clock;

      Distance_Right : Distance_cm;
      Distance_Left : Distance_cm;
      Distance_Front : Distance_cm;

   begin
      MicroBit.Console.Put_Line("Sensor task startet");
      loop

         --Distance_Right := Sensor_Right.Read;
         Distance_Left := Sensor_Left.Read;
         Distance_Front := Sensor_Front.Read;

         --Sensor_Data.Sensor_Buffer.Set_Distance_Right (Integer (Distance_Right));
         Sensor_Data.Sensor_Buffer.Set_Distance_Left (Integer (Distance_Left));
         Sensor_Data.Sensor_Buffer.Set_Distance_Front (Integer (Distance_Front));

         --MicroBit.Console.Put_Line ("Front_Right: " & Distance_cm'Image(Distance_Right));
         --MicroBit.Console.Put_Line ("Front_Left: " & Distance_cm'Image(Distance_Left));

         Next_Time := Next_Time + Period;
         delay until Next_Time;

      end loop;

   end Sensors;

end Sensor_Task;