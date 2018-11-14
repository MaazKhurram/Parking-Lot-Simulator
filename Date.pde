
class Date {
  final String [] days = {
    "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"
  };

  int today;
  int hour;
  int minute;
  String dayString;




  Date ()
  {
  }
  Date(int d, int h, int m)  // constructor
  {
    if ((d%7)+1==7) this.today=0;
    else this.today=(d%7)+1;
    this.hour=h;      //24 hour clock
    this.minute=m%60;

    this.dayString=days[today];
  }

  Date (Date d)    // contructor 2
  {
    today= d.today;
    hour= d.hour;
    minute=d.minute;
  }

  // methods--------------------------------------

  void addHour()
  {
    if (hour ==23) 
    {
      hour=0;
      today++;

      if (((today%7))==0)
      {
        today=0;

        dayString=days[today];
        //println(today,(today%7),dayString);
      } else 
      {
        dayString=days[today];
        //println(today,(today%7),dayString);
      }
    } else hour++;
  }



  void addMinute()
  {
    if ( minute == 59 ) {
      minute = 0;
      addHour();
      HourCounter++;
    } else {
      ++minute;
    }
  }

  boolean equal(Date date)
  {
    if (this.today==date.today && this.hour==date.hour && this.minute==date.minute )
      return true;
    else return false;
  }

  String toString ()
  {
    String DAY= days[today];
    String HOUR;
    String MIN;

    if (hour<10)
    {
      HOUR="0"+hour;
    } else
    {
      HOUR=""+hour;
    }

    if ( minute<10)
    {
      MIN="0"+minute;
    } else {
      MIN=""+minute;
    }


    return (DAY+"  "+ HOUR+":"+MIN);
  }
}