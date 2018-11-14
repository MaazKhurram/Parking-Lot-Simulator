class PriceCalculator {

  float totalHours1, totalHours2, totalHours;

  Date dIn = new Date ();
  Date dOut = new Date ();
  Date dRes = new Date ();  

  PriceCalculator()
  {
  }

  void PriCalcCopy(Date d1, Date d2, Date dTotal)
  {
    dIn.today=d1.today;
    dIn.hour=d1.hour;
    dIn.minute=d1.minute;
    dIn.dayString=d1.dayString;

    dOut.today=d2.today;
    dOut.hour=d2.hour;
    dOut.minute=d2.minute;
    dOut.dayString=d2.dayString;

    dRes.today=dTotal.today;
    dRes.hour=dTotal.hour;
    dRes.minute=dTotal.minute;
    dRes.dayString=dTotal.dayString;
  }


  float calculateTotalPrice()
  {
    if (dIn.today==0 || dOut.today==0)    //one of the days is Sunday
    {
      if (dIn.today==0)
      {
        return ((dIn.hour+dIn.minute/60.0)*1.5+(dOut.hour+dOut.minute/60.0)*3.0);
      } else 
      {
        return ((dIn.hour+dIn.minute/60.0)*3.0+(dOut.hour+dOut.minute/60.0)*1.5);
      }
    } else // none of the days is Sunday
    {
      if (dIn.today==0 && dOut.today==0)    // in and out on sunday
      {
        totalHours=dRes.hour+dRes.minute/60.0;
        return (1.5*totalHours);
      } else 
      {
        totalHours=dRes.hour+dRes.minute/60.0;
        return (3.0*totalHours);
      }
    }
  }
}