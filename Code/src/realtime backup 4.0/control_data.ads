with Car_Types;

package Control_Data is 

   protected Command_Buffer is
      procedure Set_Action
         (Action : Car_Types.Action_Type);

      function Get_Action
         return Car_Types.Action_Type;
   private
      Current_Action : Car_Types.Action_Type := Car_Types.Stop;
   end Command_Buffer;

end Control_Data;