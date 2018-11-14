class Gate {

  boolean status; // true=open, false=closed
  float x, y;
  float fee;

  Gate(float xCor, float yCor, boolean st)
  {
    x=xCor;
    y=yCor;
    status=st;
  }


  void OpenGate()
  {
    status = true;
  }
  void CloseGate()    // run this when parking is full
  {
    status=false;
  }

  void drawNorthConnection()
  {
    noStroke();
    fill(94, 94, 94);
    rect(400, 185, 50, 30);

    drawBarrier(400, 210);   //400,210 barrier
  }

  void drawSouthConnection()
  {
    noStroke();
    fill(94, 94, 94);
    rect(400, 605, 50, 30); //400,630 barrier
    drawBarrier(400, 630);
  }

  void drawBarrier(float xBar, float yBar)
  {
    pushMatrix();
    fill(0);
    translate(xBar, yBar);
    rotate(-PI/4);
    rect(0, 0, 50, 5);

    popMatrix();
  }
}