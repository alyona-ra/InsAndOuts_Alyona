class Catchables {
  
  Catchables(int fw, int fh, PImage fi, String type) {
    w = fw;
    h = fh;
    img = fi;
    currentType = type;
  }
  
  int w, h;
  float x = random(width, width*2);
  float y = random(hy+hh, height-h);
  float speed = random(1, 3);
  //int w, h;
  String currentType;
  PImage img;
  
  void display() {
     if (currentType == "shrimp") {
        image(shrimp, x, y);
     } else if (currentType == "fish"){
       image(img, x, y);
     }
  }
  
  void changeFish(PImage currentImg) {
      img = currentImg;
  }
}
