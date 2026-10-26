with MicroBit.Console;
with MicroBit.MotorDriver; use MicroBit.MotorDriver;
with HAL; use HAL;

package body MyCar is
speed : UInt12 := 2000;

   procedure Forward is
   begin
      Drive
        (Forward,
         (speed,speed,speed,speed));
   end Forward;
   procedure Backward is
   begin
      Drive
        (Backward,
         (speed,speed,speed,speed));
   end Backward;
   procedure Stop is
   begin
      Drive
        (Forward,
         (0,0,0,0));
   end Stop;
   procedure Rotate_Left is
   begin 
      Drive 
      (Rotating_Right,
      (speed,speed,speed,speed));
   end Rotate_Left;
   procedure Rotate_right is 
   begin 
      Drive
      (Rotating_Left, 
      (speed, speed, speed, speed));
   end Rotate_right;
   procedure Strafe_Right is
   begin
      Drive
      (Lateral_Right, 
      (speed, speed, speed, speed));
   end Strafe_Right;
   procedure Strafe_Left is 
   begin 
      Drive 
      (Lateral_Left,
      (speed, speed, speed, speed));
   end Strafe_Left;

end MyCar;