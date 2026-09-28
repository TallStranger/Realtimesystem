package body Sensor_Data is  
   protected body Sensor_Buffer is 
      procedure Set_Distance_Left (Value_Left : Integer) is
      begin 
         Distance_Left := Value_Left;
      end Set_Distance_Left;

      procedure Set_Distance_Right (Value_Right : Integer) is 
      begin 
         Distance_Right := Value_Right;
      end Set_Distance_Right;

      procedure Set_Distance_Front (Value_Front : Integer) is 
      begin 
         Distance_Front := Value_Front;
      end Set_Distance_Front;


      function Get_Distance_Right
         return Integer is 
      begin
         return Distance_Right; 
      end Get_Distance_Right;

      function Get_Distance_Left 
         return Integer is
      begin 
         return Distance_Left;
      end Get_Distance_Left;

      function Get_Distance_Front
         return Integer is 
      begin 
         return Distance_Front;
      end Get_Distance_Front;
   end Sensor_Buffer;
end Sensor_Data;