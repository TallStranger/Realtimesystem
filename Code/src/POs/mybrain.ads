package MyBrain is

   type Modes is 
         (
            Normal_Mode,
            Chaos_Mode
         );

   protected Brain is
      function GetMeasurementSensorFront return Integer; 
      function GetMeasurementSensorLeft return Integer; 
      function GetMeasurementSensorRight return Integer;
      function GetAlarm return Boolean;
      function GetMode return Modes;
  
      procedure SetMeasurementSensorFront (V : Integer); 
      procedure SetMeasurementSensorLeft (V : Integer); 
      procedure SetMeasurementSensorRight (V : Integer);
      procedure SetAlarm (V : Boolean);
      procedure SetMode (V : Modes);
   private
         MeasurementSensorFront : Integer := 0;
         MeasurementSensorLeft : Integer := 0;
         MeasurementSensorRight : Integer := 0;
         Alarm : Boolean := False;
         CurrentMode : Modes := Normal_Mode;
   end Brain;

end MyBrain;
