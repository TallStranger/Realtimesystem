package body MyMotorDriver is

   protected body MotorDriver is
      procedure SetDirection (V : Directions) is
      begin
         DriveDirection := V;
      end SetDirection;

      function GetDirection return Directions is
      begin
         return DriveDirection;
      end GetDirection;
      
   end MotorDriver;

end MyMotorDriver;
