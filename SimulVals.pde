class SimulVals
{
  float NetProfits;
  long TimeElapsed;
  long  Customers;

  SimulVals( float NP, long TE, long C)
  {
    NetProfits=NP;
    TimeElapsed=TE;
    Customers=C;
  }

  void drawSV()
  {
    strokeWeight(4);
    fill(150, 150, 150);
    rect(520, 10, 200, 100);
    textSize(15);
    fill(0);
    text("Simulation Values:", 530, 30);
    textSize(13);
    text("Net Profits:        $"+NetProfits, 530, 60);
    text("Time Elapsed:    "+TimeElapsed+" Hours", 530, 80);
    text("Customers:        "+Customers, 530, 100);
  }
}