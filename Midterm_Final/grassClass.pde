class Grass {
  int x, y;
  int w = 50;
  boolean passed = false;
  boolean hasStone = false;
  Grass(int row, int col) {
    x = row;
    y = col;
  }
   
   void display() {
     
     if (passed) {
       image(grassClean, 50*x, 250+50*y, w, w);
     } else if (!passed) {
       image(grassMess, 50*x, 250+50*y, w, w);
     }
     
     if (hasStone) {
       image(stone, 50*x, 250+18+50*y, 50, 31);
     }
   }
   
   void check(int myX, int myY) {
   if (myX == x*w - w && myY + ggw == y*w + w +250) {
        passed = true;
      }
   }
   
   void setStone(boolean smth) {
     hasStone = smth;
   }
  
}
