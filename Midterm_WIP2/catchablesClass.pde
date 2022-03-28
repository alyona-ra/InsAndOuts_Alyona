class Catchables {
  
  Catchables(int fw, int fh, PImage fi, String type) {
    w = fw;
    h = fh;
    img = fi;
    currentType = type;
  }
  
  float x = random(450);
  float y = random(250, height);
  float speed = random(1, 3);
  int w, h;
  String currentType;
  PImage img;
  
  void display() {
     if (currentType == "shrimp") {
        image(shrimp, x, y);
     } else if (currentType == "fish"){
       image(img, x, y);
     }
  }
}
