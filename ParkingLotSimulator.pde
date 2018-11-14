

/* 

*** Written by Maaz Khurram ***

   eID: maaz.khurr
   UCID number: 30051845
   Block: 3 
   Group: ORANGE
   
  Last Update: 26th November, 2017    5:02am
   
*/


// for car
float CarX=30, CarY=140;
float LCarX=410, LCarY=550;

int randomPic;
PImage[][] imgArr = new PImage[10][2];


PImage Ferrari, FerrariV;
PImage Ferrari2, Ferrari2V;
PImage Jaguar, JaguarV;
PImage Lambo, LamboV;
PImage Lambo2, Lambo2V;
PImage Lambo3, Lambo3V;
PImage Mercedes, MercedesV;
PImage Mercedes2, Mercedes2V;
PImage Bentley, BentleyV;
PImage RollsRoyce, RollsRoyceV;




long millis, previousMillis, millis2, previousMillis2;    // to delay the next car coming in
int CarGenerator, shouldIpark, whereShouldIparkSTALL, whereShouldIparkSECTION; 
int shouldIleave, whereShouldIleaveSTALL, whereShouldIleaveSECTION;

boolean occupyFlag=true;


//for stall
int StallNumber;

//for font
//PFont mono;







//for gateboxes
int spaceCounter=60;
float fee;


//for ControlPanel
int HourCounter=0;
float TotalFee=0.0;
int CustomerCounter;
int InsideCounter=-1;
long millis3, previousMillis3;





//for date
int day=day();
int hour=hour();
int minute=minute();
int second=second();






Street North= new Street(-10, 120, 900, 70, "North City Street");
Street South=new Street (-10, 630, 900, 70, "South City Street");



Gate_Boxes G1= new Gate_Boxes ();
ParkingLot P1=new ParkingLot (800, 400, 6);
Date D1=new Date (day, hour, minute);
TimeSubtractor tTest=new TimeSubtractor();
PriceCalculator PC1=new PriceCalculator();




Car[] carArray=new Car[60];

void setup() {
  size(850, 760);
  
    
    
  //for Car images
  Ferrari=loadImage("Ferrari.jpg");
  FerrariV=loadImage("FerrariVertical.jpg");
  Ferrari.resize(50, 30);
  FerrariV.resize(30, 50);

  Ferrari2=loadImage("Ferrari2.jpg");
  Ferrari2V=loadImage("Ferrari2Vertical.jpg");
  Ferrari2.resize(50, 30);
  Ferrari2V.resize(30, 50);

  Lambo=loadImage("Lambo.jpg");
  LamboV=loadImage("LamboVertical.jpg");
  Lambo.resize(50, 30);
  LamboV.resize(30, 50);

  Jaguar=loadImage("Jaguar.jpg");
  JaguarV=loadImage("JaguarVertical.jpg");
  Jaguar.resize(50, 30);
  JaguarV.resize(30, 50);

  Lambo2=loadImage("Lambo2.jpg");
  Lambo2V=loadImage("Lambo2Vertical.jpg");
  Lambo2.resize(50, 30);
  Lambo2V.resize(30, 50);

  Lambo3=loadImage("Lambo3.jpg");
  Lambo3V=loadImage("Lambo3Vertical.jpg");
  Lambo3.resize(50, 30);
  Lambo3V.resize(30, 50);

  Mercedes=loadImage("Mercedes.jpg");
  MercedesV=loadImage("MercedesVertical.jpg");
  Mercedes.resize(50, 30);
  MercedesV.resize(30, 50);

  Mercedes2=loadImage("Mercedes2.jpg");
  Mercedes2V=loadImage("Mercedes2Vertical.jpg");
  Mercedes2.resize(50, 30);
  Mercedes2V.resize(30, 50);

  Bentley=loadImage("Bentley.jpg");
  BentleyV=loadImage("BentleyVertical.jpg");
  Bentley.resize(50, 30);
  BentleyV.resize(30, 50);

  RollsRoyce=loadImage("RollsRoyce.jpg");
  RollsRoyceV=loadImage("RollsRoyceVertical.jpg");
  RollsRoyce.resize(50, 30);
  RollsRoyceV.resize(30, 50);





  imgArr[0][0]=Ferrari;
  imgArr[0][1]=FerrariV;

  imgArr[1][0]=Ferrari2;
  imgArr[1][1]=Ferrari2V;

  imgArr[2][0]=Lambo;
  imgArr[2][1]=LamboV;

  imgArr[3][0]=Jaguar;
  imgArr[3][1]=JaguarV;

  imgArr[4][0]=Lambo2;
  imgArr[4][1]=Lambo2V;

  imgArr[5][0]=Lambo3;
  imgArr[5][1]=Lambo3V;

  imgArr[6][0]=Mercedes;
  imgArr[6][1]=MercedesV;

  imgArr[7][0]=Mercedes2;
  imgArr[7][1]=Mercedes2V;

  imgArr[8][0]=Bentley;
  imgArr[8][1]=BentleyV;

  imgArr[9][0]=RollsRoyce;
  imgArr[9][1]=RollsRoyceV;



  for (int i=0; i<carArray.length; i++)    //carArray=0-->79
  {
    randomPic=(int)random(0, 10);
    carArray[i]=new Car(CarX, CarY, i, imgArr[randomPic]);
  }
}

void draw()
{
  background (#003A01);
  millis=millis();
  millis2=millis();






  CarGenerator=(int)random(1, 50);


  shouldIpark=(int)random(0, 10);
  shouldIleave=(int)random(0, 100);



  if (CarGenerator%10==0 && millis-previousMillis>1000 )       // generates a car randomly
  {
    previousMillis=millis;


    for (int i=0; i<carArray.length; i++)
    {

      if (carArray[i].active==false)      // activates the first vacant object
      { 

        
        carArray[i].active=true;
        if (shouldIpark%2==0 && carArray[i].Parking==false && P1.NorthGate.status==true)           // if the car has to park
        {
          carArray[i].Parking=true;
          do {           // which parking stall??
            //println("Parking true for "+carArray[i].NumberPlate+" SEARCHING PLACE");
            whereShouldIparkSECTION=(int)random(0, 6);
            whereShouldIparkSTALL=(int)random(0, 10);






            occupyFlag=true;


            for (int j=0; j<carArray.length; j++)
            {
              if (carArray[j].Section==whereShouldIparkSECTION && carArray[j].Stall==whereShouldIparkSTALL)
              {

                occupyFlag=false;
                break;
              }
            }
          } while (occupyFlag==false);    // select a combination until the current combination is occupied


          carArray[i].Section=whereShouldIparkSECTION;
          carArray[i].Stall=whereShouldIparkSTALL;


          
          break;
        }
        break;
      }
    }
  }



  if (shouldIleave%3==0 && millis2-previousMillis2>1000)      // for leaving
  {
    previousMillis2=millis2;
    whereShouldIleaveSECTION=(int)random(0, 6);
    whereShouldIleaveSTALL=(int)random(0, 10);

    for (int i=0; i<carArray.length; i++)
    {

      if (carArray[i].active==true && carArray[i].Parking==true && carArray[i].Section==whereShouldIleaveSECTION && carArray[i].Stall==whereShouldIleaveSTALL)
      {
        if (P1.section_Array[carArray[i].Section].StallArray[carArray[i].Stall].occupied==true)
        {

          
          carArray[i].LeaveParking=true;
          carArray[i].xPos=LCarX;
          carArray[i].yPos=LCarY;
          break;
        }
      }
    }
  }












  ControlPanel C1= new ControlPanel();
  C1.constructCP();        // controlPanel
  North.drawStreet();
  South.drawStreet();
  P1.drawLot();
  P1.NorthGate.drawNorthConnection();
  P1.SouthGate.drawSouthConnection();

  // for carDisplay after this point!!


  for (int i=0; i<carArray.length; i++)        //for moving in
  {
    if (carArray[i].Parking==false && carArray[i].active==true && carArray[i].LeaveParking==false)
    {
      carArray[i].GoStraight();
    } else if (carArray[i].Parking==true && carArray[i].active==true && carArray[i].LeaveParking==false)
    {

      carArray[i].MoveIntoParkingLot();
    }
  }



  for (int i=0; i<carArray.length; i++)      //for moving out
  {
    if (carArray[i].Parking==true  && carArray[i].LeaveParking==true)
    {

      carArray[i].MoveOutOfParkingLot();
    }
  }


  G1.constructBoxes(spaceCounter, fee);
  D1.addMinute();
}