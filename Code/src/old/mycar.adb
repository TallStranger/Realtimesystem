with MicroBit.Console;
with MicroBit.MotorDriver; use MicroBit.MotorDriver;

package body MyCar is

   procedure Forward is
   begin
      Drive
        (Forward,
         (4095,4095,4095,4095));
   end Forward;
   procedure Backward is
   begin
      Drive
        (Backward,
         (4095,4095,4095,4095));
   end Backward;
   procedure Rotate_Left is
   begin
      Drive
        (Forward,
         (0,0,4095,4095));
   end Rotate_Left;
   procedure Rotate_Right is   
   begin
      Drive
        (Forward,
         (4095,4095,0,0));
   end Rotate_Right;
   procedure Stop is
   begin
      Drive
        (Forward,
         (0,0,0,0));
   end Stop;
   procedure Rotate_180_Left is
   begin 
      Drive 
      (Rotating_Right,
      (4095,4095,4095,4095));
   end Rotate_180_Left;
   procedure Rotate_180_right is 
   begin 
      Drive
      (Rotating_Left, 
      (4095, 4095, 4095, 4095));
   end Rotate_180_right;
   

end MyCar;