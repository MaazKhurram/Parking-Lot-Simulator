class Street {

  String StrtName;
  float xCordinate, yCordinate, length_of_street, width_of_street;
  String Name_of_Street;



  Street(float xCor, float yCor, float len, float wid, String name)    //constructor
  {
    xCordinate=xCor;
    yCordinate=yCor;
    length_of_street=len;
    width_of_street=wid;
    Name_of_Street=name;
  }

  void drawStreet()
  {
    stroke(255);
    strokeWeight(3);
    fill(94, 94, 94);
    rect(xCordinate, yCordinate, length_of_street, width_of_street);
    fill(255);
    text(Name_of_Street, xCordinate+(length_of_street/2) - 40, yCordinate+(width_of_street)/2);
  }
}