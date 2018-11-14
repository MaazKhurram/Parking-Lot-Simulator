class ParkingStallSection
{
  float SectionX;
  float SectionY;






  ParkingStall[] StallArray=new ParkingStall[10];     // has an array of 10 parking stalls

  ParkingStallSection( float x, float y)    // constructor
  {

    SectionX=x;
    SectionY=y;

    for (int i=0; i<10; i++)            // fills each 
    {


      StallArray[i]=new ParkingStall( SectionX, SectionY, StallNumber++);    // each stall is created
      SectionX+=70;

      if (i==4)
      {

        SectionY+=40;
        SectionX=x;
      }
    }
  }



  void drawSection(int n)
  {

    for (int i=0; i<10; i++)
    {
      fill(255, 0, 0);
      text(n, SectionX, SectionY);
      StallArray[i].drawStall(i);
    }
  }
}