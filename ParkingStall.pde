
class ParkingStall {
  // STALL ATTRIBUTES
  boolean occupied=false;
  boolean previousOccupied;
  int occupyCounter;

  Date occupy=new Date();
  Date left=new Date();


  // DIMENSIONS AND POSITION
  float stallWidth=70;
  float stallHeight=40;
  float posX;
  float posY;
  int StallNum;

  ParkingStall( float x, float y, int SN) {      // constructor
    posX = x;
    posY = y;
    StallNum=SN;
  }

  void drawStall(int i) {
    if (occupied)
    {

      fill(255, 90, 71); // RED STALL
      strokeWeight(4);
      stroke(255);
      rect(posX, posY, stallWidth, stallHeight);
      fill(0);
      text(i, posX, posY);
      strokeWeight(3);
      previousOccupied=occupied;

      if (previousOccupied!=occupied)
      {
        occupy.today=D1.today;
        occupy.hour=D1.hour;
        occupy.minute=D1.minute;
        occupy.dayString=D1.dayString;
      }
    } else
    {
      if (previousOccupied!=occupied)
      {
        left.today=D1.today;
        left.hour=D1.hour;
        left.minute=D1.minute;
        left.dayString=D1.dayString;
      }

      fill(152, 251, 152);  // GREEN STALL
      strokeWeight(4);
      stroke(255);
      rect(posX, posY, stallWidth, stallHeight);
      fill(0);
      text(i, posX, posY);
      strokeWeight(3);

      previousOccupied=occupied;
    }
  }
}