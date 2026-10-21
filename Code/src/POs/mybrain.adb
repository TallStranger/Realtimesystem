package body MyBrain is

     
    protected body Brain is
      --  procedures can modify the data
      procedure SetMeasurementSensorFront (V : Integer) is
      begin
         MeasurementSensorFront := V;
      end SetMeasurementSensorFront;

      --  functions cannot modify the data
      function GetMeasurementSensorFront return Integer is
      begin
         return MeasurementSensorFront;
      end GetMeasurementSensorFront;
      
      --  procedures can modify the data
      procedure SetMeasurementSensorLeft (V : Integer) is
      begin
         MeasurementSensorLeft := V;
      end SetMeasurementSensorLeft;

      --  functions cannot modify the data
      function GetMeasurementSensorLeft return Integer is
      begin
         return MeasurementSensorLeft;
      end GetMeasurementSensorLeft;

      procedure SetMeasurementSensorRight (V : Integer) is 
      begin 
         MeasurementSensorRight := V;
      end SetMeasurementSensorRight;

      function GetMeasurementSensorRight return Integer is
      begin 
         return MeasurementSensorRight;
      end GetMeasurementSensorRight;

      procedure SetAlarm (V : Boolean) is 
      begin 
         Alarm := V;
      end SetAlarm;

      function GetAlarm return Boolean is
      begin 
         return Alarm;
      end GetAlarm;

      procedure SetMode (V: Modes) is 
      begin 
         CurrentMode := V;
      end SetMode;

      function GetMode return Modes is 
      begin 
         return CurrentMode;
      end GetMode;

      procedure SetAccelVal (V : Integer) is 
      begin 
         AccelVal := V;
      end SetAccelVal;

      function GetAccelVal return Integer is 
      begin 
         return AccelVal;
      end GetAccelVal;
   end Brain;

end MyBrain;
