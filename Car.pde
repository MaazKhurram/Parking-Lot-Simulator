class Car
{


  boolean active=false, Parking=false, LeaveParking=false;
  float xPos, yPos;
  int NumberPlate;

  PImage img1, img1V;



  int Stall=-1, Section=-1;

  Date Enter=new Date () ;
  Date Leave=new Date();



  Car(float x, float y, int np, PImage IMAGEarr[]) {
    xPos=x;
    yPos=y;
    NumberPlate=np;

    img1=IMAGEarr[0];
    img1V=IMAGEarr[1];
  }

  Car()
  {
  }

  void MoveIntoParkingLot()
  {

    if (xPos<410)
    {
      xPos++;
      drawCarForward();
    } else if (xPos==410 && yPos==210)      // car disappear in parking lot
    {
      spaceCounter--;
      yPos++;

      P1.section_Array[Section].StallArray[Stall].occupied=true;

      //println("Car: "+NumberPlate+"Section:"+Section+"   Stall:"+Stall+"  OCCUPIED");
      {
        Enter.today=D1.today;
        Enter.hour=D1.hour;
        Enter.minute=D1.minute;
        Enter.dayString=D1.dayString;
      }
    } else if (xPos==410 && yPos<211)
    {


      drawCarDown();
      moveDown();
    }
  }




  void MoveOutOfParkingLot()
  {

    if (yPos< 650 && xPos==410)
    {
      if (yPos==610)
      {
        spaceCounter++;


        Leave.today=D1.today;
        Leave.hour=D1.hour;
        Leave.minute=D1.minute;
        Leave.dayString=D1.dayString;

        //println("LEAVE"+Leave);
        tTest.TimSubCopy(Enter, Leave);
        tTest.Tell_me_Duration();
        PC1.PriCalcCopy(tTest.dRes1, tTest.dRes2, tTest.dResTotal);
        fee=PC1.calculateTotalPrice();
        TotalFee+=fee;
        CustomerCounter++;
      }


      P1.section_Array[Section].StallArray[Stall].occupied=false;
      moveDown();
      drawCarDown();
    }

    if (yPos==650 && xPos==800)
    {
      GoStraight();



      yPos++;
      //println("DOWN OBJECT DESTROYED CAR:  "+ NumberPlate,Parking,Section,Stall);
    } else if ( yPos==650 && xPos<=800)
    {
      GoStraight();
    }
  }




  void moveDown()
  {
    yPos++;
  }

  void moveForward()
  {
    xPos++;
  }


  void drawCarForward()
  {
    fill(0);
    text("Car: "+NumberPlate, xPos, yPos);
    image(img1, xPos, yPos);
  }

  void drawCarDown()
  {
    fill(0);
    text("Car: "+NumberPlate, xPos, yPos);
    image(img1V, xPos, yPos);
  }

  void GoStraight()
  {
    if (xPos<800)
    {
      fill(0);
      text("Car: "+NumberPlate, xPos, yPos);
      moveForward();
      drawCarForward();
    } else if (xPos==800)
    {

      active=false;
      Parking=false;
      LeaveParking=false;
      Stall=-1;
      Section=-1;
      xPos=30;
      yPos=140;
      //println("Car: "+NumberPlate+" deactivated", Parking, Stall, Section);
    }
  }
}