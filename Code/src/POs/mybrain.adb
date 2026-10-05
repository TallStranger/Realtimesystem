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
   end Brain;

end MyBrain;
