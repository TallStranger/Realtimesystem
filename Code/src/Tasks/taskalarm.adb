with Ada.Real_Time; use Ada.Real_Time;
with MicroBit.Console;
with MicroBit.Music; use MicroBit.Music;
with MyBrain;
with Ada.Execution_Time; use Ada.Execution_Time;

package body TaskAlarm is

   task body Alarm_Task is
      MyClock : Time;
      TimeTook : Time_Span;
   begin

      loop

         MyClock := Clock;

         if MyBrain.Brain.GetAlarm then
            Play (27, Note'(P => A4, Ms => 5));
         else 
            Play (27, Rest);
         end if;
         TimeTook := Clock - MyClock;
         MicroBit.Console.Put_Line("Alarm time: " & To_Duration (TimeTook)'Image);
         delay until MyClock + Milliseconds (250);

      end loop;

   end Alarm_Task;

end TaskAlarm;