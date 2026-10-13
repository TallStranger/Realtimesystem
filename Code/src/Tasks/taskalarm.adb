with Ada.Real_Time; use Ada.Real_Time;
with MicroBit.Music; use MicroBit.Music;
with MyBrain;

package body TaskAlarm is

   task body Alarm_Task is
      MyClock : Time;
   begin

      loop

         MyClock := Clock;

         if MyBrain.Brain.GetAlarm then

            Play (27, Note'(P => A4, Ms => 50));

         end if;

         delay until MyClock + Milliseconds (100);

      end loop;

   end Alarm_Task;

end TaskAlarm;