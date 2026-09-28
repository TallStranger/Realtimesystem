with Car_Types;

package body Control_Data is

   protected body Command_Buffer is

      procedure Set_Action
         (Action : Car_Types.Action_Type) is 
      begin 
         Current_Action := Action;
      end Set_Action;

      function Get_Action
         return Car_Types.Action_Type is 
      begin 
         return Current_Action;
      end Get_Action;
         

   end Command_Buffer;

end Control_Data;