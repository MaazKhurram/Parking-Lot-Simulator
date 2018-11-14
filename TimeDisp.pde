class TimeDisp
{
  int h, m;
  String D;


  TimeDisp(String day, int hour, int min)
  {
    D=day;
    h=hour;
    m=min;
  }

  TimeDisp(Date d)
  {
    h=d.hour;
    m=d.minute;
    D=d.dayString;
  }


  void drawTime()
  {
    noStroke();
    fill(#129007);
    //rect(740, 10, 100, 100);
    fill(5,255,5);
    
   
    textSize(15);
    text(D, 750, 40);
    

    if (h<10 && m<10) text("0"+h+" : 0"+m+" ", 750, 80);

    else if (h<10)text("0"+h+" : "+m+" ", 750, 80);
    else if (m<10)text(h+" : "+"0"+m+" ", 750, 80);

    if (h>=10 && m>=10)text(h+" : "+m+" ", 750, 80);
  }
}