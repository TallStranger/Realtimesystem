with Ada.Text_IO;
with Control_Data;
with Car_Types;
with MicroBit.Types;
with Sensor_Data;

--use Car_Types;
with MicroBit.Console;

package body Control_Task is
   task body Controller is
   Distance : Integer;
   begin

      loop
         
         Distance := Sensor_Data.Sensor_Buffer.Get_Distance_Front;
         MicroBit.Console.Put_Line("Front Sensor" & Integer'Image(Distance));
         if Distance <= 30 then 
            MicroBit.Console.Put_Line("Fremover");
            Control_Data.Command_Buffer.Set_Action(Car_Types.Rotate_180_Left);
         else
            Control_Data.Command_Buffer.Set_Action (Car_Types.Stop);
         end if;
         delay 1.0;
      end loop;
   end Controller;
end Control_Task;