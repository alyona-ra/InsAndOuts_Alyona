class Grass {
  //Grass(float gx, float gy) {
  //  float x = gx;
  //  float y = gy;
  //}
   float x = width/8;
   float y = height/12;
   
   void display(int row, int col) {
     int r = row;
     int c = col;
     stroke(0);
     fill(0, 255, 50);
     rect(x*r, y*c, width/4, height/4);
   }
  
}
