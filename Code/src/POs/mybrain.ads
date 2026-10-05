package MyBrain is

   protected Brain is
      function GetMeasurementSensorFront return Integer; -- concurrent read operations are now possible
      function GetMeasurementSensorLeft return Integer; -- concurrent read operations are now possible
      function GetMeasurementSensorRight return Integer;
  
      procedure SetMeasurementSensorFront (V : Integer); -- but concurrent read/write are not!
      procedure SetMeasurementSensorLeft (V : Integer); -- but concurrent read/write are not!
      procedure SetMeasurementSensorRight (V : Integer);
   private
         MeasurementSensorFront : Integer := 0;
         MeasurementSensorLeft : Integer := 0;
         MeasurementSensorRight : Integer := 0;
   end Brain;

end MyBrain;
