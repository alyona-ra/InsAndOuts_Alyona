// Still Life –  Alyona Radkevich

//1. Press ENTER or RETURN to start
//2. Click on the colored squares to apply the color on the canvas

PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage img8;
PImage img9;
PImage img10;
PImage img11;
PImage img12;
PImage img13;
PImage img14;
PImage img15;
PImage img16;
PImage img17;
PImage img18;

color[] colors = {#d1a5c8, #c194b3, #a28895, #928283, #797470, #716b65, #6c655d, #61605b, #5f5b52, #534a45, #4d443f, #4b4137, #746457, #735a51, #322723, #2d2324, #261a1a, #160b09};

boolean drawing = false;

int sqrW = 10;
int clrW = 20;
int clrP = 10;


void setup() {
  size(700, 900);
  
  img1 = loadImage("1.png");
  img2 = loadImage("2.png");
  img3 = loadImage("3.png");
  img4 = loadImage("4.png");
  img5 = loadImage("5.png");
  img6 = loadImage("6.png");
  img7 = loadImage("7.png");
  img8 = loadImage("8.png");
  img9 = loadImage("9.png");
  img10 = loadImage("10.png");
  img11 = loadImage("11.png");
  img12 = loadImage("12.png");
  img13 = loadImage("13.png");
  img14 = loadImage("14.png");
  img15 = loadImage("15.png");
  img16 = loadImage("16.png");
  img17 = loadImage("17.png");
  img18 = loadImage("18.png");
    
}

void draw() {

  if (!drawing) {
    for (int i = 0; i < width; i += sqrW*2) {
      for (int k = 0; k < height; k += sqrW*2) {
        noStroke();
        fill(#EAEAEA);
        rect(i, k, sqrW, sqrW);
        rect(i + sqrW, k + sqrW, sqrW, sqrW);
        fill(#C6C6C6);
        rect(i + sqrW, k, sqrW, sqrW);
        rect(i, k + sqrW, sqrW, sqrW);
      }
    }
  } else if (drawing) {
    stroke(255);
    int x = (width - clrW*18 - clrP*17) / 2;
    int y = 20;
    for (int i = 0; i < 18; i++) {
      fill(colors[i]);
      rect(x, y, clrW, clrW);
      x += clrW + 10;
    }
  }
}

void mousePressed() {
  if (drawing) {
    getLocation(mouseX, mouseY);
  }
}

void drawImg(int location) {
  if (location == 1) {
    image(img1, 0, 0);
  } else if (location == 2) {
    image(img2, 0, 0);
  } else if (location == 3) {
    image(img3, 0, 0);
  } else if (location == 4) {
    image(img4, 0, 0);
  } else if (location == 5) {
    image(img5, 0, 0);
  } else if (location == 6) {
    image(img6, 0, 0);
  } else if (location == 7) {
    image(img7, 0, 0);
  } else if (location == 8) {
    image(img8, 0, 0);
  } else if (location == 9) {
    image(img9, 0, 0);
  } else if (location == 10) {
    image(img10, 0, 0);
  } else if (location == 11) {
    image(img11, 0, 0);
  } else if (location == 12) {
    image(img12, 0, 0);
  } else if (location == 13) {
    image(img13, 0, 0);
  } else if (location == 14) {
    image(img14, 0, 0);
  } else if (location == 15) {
    image(img15, 0, 0);
  } else if (location == 16) {
    image(img16, 0, 0);
  } else if (location == 17) {
    image(img17, 0, 0);
  } else if (location == 18) {
    image(img18, 0, 0);
  }
}

int getLocation(float mX, float mY) {
  int location = 0;
  
  int x = (width - clrW*18 - clrP*17) / 2;
  int y = 20;
    for (int i = 0; i < 18; i++) {
      if (mX > x+i*(clrW+clrP) && mX < x+clrW+i*(clrW+clrP) && mY > y && mY < y+clrW) {
        location = i+1;
        x += clrW + clrP;
      }
    }

  drawImg(location);
  return location;
}

void keyPressed() {
  if (key == ENTER || key == RETURN) {
    drawing = true;
  }
}
