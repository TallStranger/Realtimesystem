
package Sensor_Data is
   protected Sensor_Buffer is

      procedure Set_Distance_Right(Value_Right : Integer);

      procedure Set_Distance_Left(Value_Left : Integer);

      procedure Set_Distance_Front(Value_Front: Integer);

      function Get_Distance_Right
         return Integer;
      
      function Get_Distance_Left
         return Integer;
      
      function Get_Distance_Front
         return Integer;

   private

      Distance_Right : Integer := 0;
      Distance_Left : Integer := 0;
      Distance_Front : Integer := 0;

   end Sensor_Buffer;
end Sensor_Data;