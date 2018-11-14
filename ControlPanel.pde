class ControlPanel {

  float weekday_rate=3.00;
  float Sunday_rate=1.50;

  String[] days={"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};




  RateList Rl1 = new RateList(weekday_rate, Sunday_rate);
  PausePlay PP1= new PausePlay();
  SimulVals SV1=new SimulVals(TotalFee, HourCounter, CustomerCounter);
  TimeDisp T1=new TimeDisp(D1); // give to date class and take it back




  void constructCP()
  {
    stroke(0);
    strokeWeight(5);
    Rl1.drawRL();
    PP1.drawPP();
    SV1.drawSV();
    T1.drawTime();
    noStroke();
  }
}