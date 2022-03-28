class Enemy {
  float w = 154;
  float h = 234;
  float x = -w;
  float y = 320;
  
  void display() {
    image(deadline, x, y, w, h);
  }
}
