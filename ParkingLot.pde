class ParkingLot
{
  float lotWidth;
  float lotHeight;
  int number_of_sections;

  int x=50, y=250;    // lot rectangle coordinates

  ParkingStallSection[] section_Array= new ParkingStallSection[6];     // created an array of objects "section_Array" of type 
  //ParkingStallSection

  Gate NorthGate=new Gate(400, 200, true);
  Gate SouthGate=new Gate(400, 800, true);

  ParkingLot (float w, float h, int number_of_sections1)
  {
    lotWidth=w;
    lotHeight=h;
    number_of_sections=number_of_sections1;




    for (int i=0; i<number_of_sections/2; i++)
    {

      section_Array[i]=new ParkingStallSection(x, y);     // constructing Parking Section in each section
      y+=120;
    }

    x=450;
    y=250;

    for (int i=3; i<number_of_sections; i++)
    {

      section_Array[i]=new ParkingStallSection( x, y); 
      y+=120;
    }
  }

  void drawLot()
  {


    fill(95, 95, 95);
    strokeWeight(4);
    stroke(255);
    rect(25, 210, lotWidth, lotHeight);

    if (spaceCounter>0)  NorthGate.status=true;
    else NorthGate.status=false;

    for (int i=0; i<number_of_sections; i++)
    {
      section_Array[i].drawSection(i);
    }
  }
}