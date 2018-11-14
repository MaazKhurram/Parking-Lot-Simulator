class Gate_Boxes
{
  int spacesLeft;
  float Tfee;

  void constructBoxes(int spaceLeft, float TotalFee1 )
  {
    drawEntranceBox();
    drawExitBox();
    spacesLeft=spaceLeft;
    Tfee=TotalFee1;
  }

  void drawEntranceBox()
  {
    strokeWeight(4);
    stroke(0);
    fill(255);
    rect (270, 200, 120, 20);
    fill(0);
    text("ENTRANCE", 295, 215);
    fill(105, 97, 254);
    rect(270, 220, 120, 20);

    updateSpace();
  }

  void updateSpace()
  {
    fill(0);
    text("Spaces: "+ spacesLeft, 295, 235); // replace 50 by calculated available spaces
  }

  void drawExitBox()
  {
    strokeWeight(4);
    stroke(0);
    fill(255);
    rect (270, 600, 120, 20);
    fill(0);
    text("EXIT", 320, 615);
    fill(105, 97, 254);
    rect(270, 620, 120, 20);

    updateFee(Tfee);
  }

  void updateFee(float f)  //f=fee
  {
    fill(0);
    text("Fee: $"+ f, 280, 635); // replace 50 by fee from fee calculator
  }
}