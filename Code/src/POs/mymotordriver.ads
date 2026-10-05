--Important: use Microbit.IOsForTasking for controlling pins as the timer used there is implemented as an protected object
With MicroBit.IOsForTasking; use MicroBit.IOsForTasking; -- we only depend on this for Analog_Value definition and Pin_Id. This could be abstracted so there is a smaller dependency!

package MyMotorDriver is

   type Directions is (Forward, Stop, Rotate_180_Left, Rotate_180_right, Strafe_Right, Strafe_Left); --only two are implemented but many configuration are possible with mecanum wheels
   
   protected MotorDriver is
      -- see https://learn.adacore.com/courses/Ada_For_The_Embedded_C_Developer/chapters/03_Concurrency.html#protected-objects
      function GetDirection return Directions; -- concurrent read operations are now possible
      
      procedure SetDirection (V : Directions); -- but concurrent read/write are not!
   private
      DriveDirection : Directions := Stop;
   end MotorDriver;

end MyMotorDriver;
