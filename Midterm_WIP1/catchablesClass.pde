class Catchables {
  
  Catchables(float type) {
    currentType = type;
  }
  
  float x = random(450);
  float y = random(200, height);
  int w = 20;
  int h = 20;
  float currentType;
  
  void display() {
     if (currentType > 0.7) {
        fill(255, 255, 0);
        rect(x, y, w, h);
     } else {
       fill(255, 0, 0);
       rect(x, y, w, h);
     }
  }
  
  void drawFish() {
    fill(255, 255, 0);
    rect(x, y, w, h);
  }
  
  void drawShrimp() {
    fill(255, 0, 0);
    rect(x, y, w, h);
  }
}
