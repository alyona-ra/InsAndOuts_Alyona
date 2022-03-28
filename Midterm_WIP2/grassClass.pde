class Grass {
  int x, y;
  int w = 50;
  boolean passed = false;
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
   }
   
   void check(int myX, int myY) {
   // if (myX == x*w && myY + ggw == y*w + w +250) {
   //     passed = true;
   //   }
   //}
   if (myX == x*w - w && myY + ggw == y*w + w +250) {
        passed = true;
      }
   }
  
}
