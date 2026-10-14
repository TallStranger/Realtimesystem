With MicroBit.IOsForTasking; use MicroBit.IOsForTasking; 

package MyMotorDriver is

   type Directions is (Forward, Stop, Rotate_Left, Rotate_right, Strafe_Right, Strafe_Left, Backward); 
   
   protected MotorDriver is
      function GetDirection return Directions; 
      
      procedure SetDirection (V : Directions); 
   private
      DriveDirection : Directions := Stop;
   end MotorDriver;

end MyMotorDriver;
