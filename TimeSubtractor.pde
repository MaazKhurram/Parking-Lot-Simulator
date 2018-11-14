class TimeSubtractor
{


  Date d1=new Date ();
  Date d2=new Date ();



  int counter=0;
  int minCounter, hourCounter;
  int minCorrection;

  Date dMidnight1=new Date ();
  Date dMidnight2=new Date ();  // midnight2 = manipulated midnight

  Date dRes1 = new Date ();    // to store results
  Date dRes2 = new Date ();
  Date dResTotal = new Date ();



  TimeSubtractor()
  {
    dMidnight1.hour=0;
    dMidnight1.minute=0;
    dMidnight2.hour=24;
    dMidnight2.minute=0;
  }

  void   TimSubCopy(Date dFirst, Date dSecond)
  {
    d1.today=dFirst.today;
    d1.hour=dFirst.hour;
    d1.minute=dFirst.minute;
    d1.dayString=dFirst.dayString;

    d2.today=dSecond.today;
    d2.hour=dSecond.hour;
    d2.minute=dSecond.minute;
    d2.dayString=dSecond.dayString;
  }



  void Tell_me_Duration()
  {
    if (d1.today==d2.today) TimeDiffDaySame(d1, d2);  // days are same
    else if ((d1.today!=d2.today) && (d1.today==0 || d2.today ==0)) TimeDiffDaySun(d1, d2);    // if one of the days is Sunday
    else if ((d1.today!=d2.today) && (d1.today!=0 || d2.today !=0)) TimeDiffDayDiff(d1, d2);    // if none of the days is Sunday
  }

  void TimeDiffDaySame(Date dI, Date dF)  
  {
    if (counter==0 )
    {
      if (dI.hour==dF.hour) //hours are same
      {
        dRes1.hour=0;
        dRes1.minute=HrsSame_minDiff(dI.minute, dF.minute);
      } else if (dI.hour!=dF.hour)     //hours are different
      {
        if (dI.minute>dF.minute) dRes1.hour=hourDiff(dI.hour, dF.hour)-1;
        else dRes1.hour=hourDiff(dI.hour, dF.hour);
        dRes1.minute=HrsDiff_minDiff(dI.minute, dF.minute);
      }
      counter++;
    }

    if (counter==1) //second run
    {
      if (dI.hour==dF.hour) //hours are same
      {
        dRes2.hour=0;
        dRes2.minute=HrsSame_minDiff(dI.minute, dF.minute);
      } else if (dI.hour!=dF.hour)     //hours are different
      {
        if (dI.minute>dF.minute) dRes2.hour=hourDiff(dI.hour, dF.hour)-1;
        else dRes2.hour=hourDiff(dI.hour, dF.hour);
        dRes2.minute=HrsDiff_minDiff(dI.minute, dF.minute);
      }
    }
  }

  void TimeDiffDaySun(Date dI, Date dF)
  {

    if (dI.today==0)      // sunday and Monday
    {
      dRes1.today=0;
      dRes2.today=1;
      dMidnight1.today=1;            //Monday midnight
      TimeDiffDaySame(dI, dMidnight2);      //Sunday to Monday midnight
      TimeDiffDaySame (dMidnight1, dF);      //Monday midnight to Monday
    } else if (dF.today==0)    // Saturday and Sunday
    {
      dRes1.today=6;
      dRes2.today=0;
      dMidnight1.today=0;            // Sunday midnight
      TimeDiffDaySame(dI, dMidnight2);      //Sunday to Monday midnight
      TimeDiffDaySame (dMidnight1, dF);      //Monday midnight to Monday
    }
  }


  void TimeDiffDayDiff(Date dI, Date dF)
  {

    dMidnight2.today=dI.today;
    dMidnight1.today=dF.today;

    TimeDiffDaySame(dI, dMidnight2);
    TimeDiffDaySame(dMidnight1, dF);

    dResTotal.hour=dRes1.hour+dRes2.hour;
    dResTotal.minute=dRes1.minute+dRes2.minute;

    if (dResTotal.minute>=60) {
      minCorrection=dResTotal.minute/60;
      dResTotal.hour+=minCorrection;
      dResTotal.minute-=minCorrection*60;
    }
  }


  int hourDiff(int hFirst, int hSecond)
  {
    return abs(hSecond-hFirst);
  }

  int HrsSame_minDiff(int mFirst, int mSecond)
  {
    return abs(mSecond-mFirst);
  }

  int HrsDiff_minDiff(int mFirst, int mSecond)
  {
    if (mFirst<mSecond) return HrsSame_minDiff(mFirst, mSecond);
    else return((60-mFirst)+mSecond);
  }

  void dispTime()
  {
    if (d1.today!=d2.today)
      println(dRes1.hour, dRes1.minute, dRes2.hour, dRes2.minute);
    println(dResTotal.hour, dResTotal.minute);
  }
}