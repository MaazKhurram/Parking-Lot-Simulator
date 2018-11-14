class PausePlay
{



  void drawPP()
  {
    millis3=millis();


    fill(150, 150, 150);
    rect(290, 10, 200, 100);
    strokeWeight(3);
    ellipse(340, 60, 80, 80);    //left circle 
    ellipse(440, 60, 80, 80);    //right circle

    fill(0, 200, 0);
    triangle(325, 34.02, 325, 85.98, 370, 60);

    fill(0);
    rect(420, 30, 10, 60, 10, 10, 10, 10);
    rect(450, 30, 10, 60, 10, 10, 10, 10);



    if (mousePressed && (millis3-previousMillis3)>500) {
      previousMillis3=millis3;

      if (pow((mouseX - 340), 2) + pow((mouseY - 60), 2)<= pow(40, 2) )
      {
        
        loop();
      } else if (pow((mouseX - 440), 2) + pow((mouseY - 60), 2)<= pow(40, 2) )
      {
        
        noLoop();

        while (true) {

          drawPP();
          if (mousePressed && pow((mouseX - 340), 2) + pow((mouseY - 60), 2)<= pow(40, 2) )
          {
            //println("INSIDE Play");
            previousMillis2=millis();
            previousMillis=millis();
            loop();
            break;
          }
        }
      }
    }
  }
}