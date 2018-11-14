class RateList
{
  float Wrate, Srate;

  RateList(float W, float Sun)
  {
    Wrate=W;
    Srate=Sun;
  }

  void drawRL()
  {
    fill(150, 150, 150);
    rect(10, 10, 250, 100);

    fill(0);
    textSize(15);
    text("Parking Rates:", 20, 40);

    textSize(13);
    text("$"+ Wrate + "/Hour    " + "Monday - Saturday", 20, 70);
    text("$"+Srate+"/Hour    "+"Sunday", 20, 90);
  }
}