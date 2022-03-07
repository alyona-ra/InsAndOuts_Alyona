//Indoors by Alyona Radkevich

//Click anywhere to see some magic.
//Hover over the glass in the window. 

boolean night = false;

int winX = 100;
int winY = 100;
int winW = 200;
int winH = 300;
int winStep = 100;

int glMar = 10;
int glNum = 6;
float glW = (winW - 3*glMar)/2;
float glH = (winH - 4*glMar)/3;

color winC;
color glC;
color wallC;
color floorC;
color lightsC;

void setup() {
  size(1000,700);
}

void draw() {
  noStroke();
  
  if (night) {
    wallC = #615E71;
    floorC = #53515D;
    winC = #242424;
  } else if (!night) {
    wallC = #ECE8FA;
    floorC = #FAF6E8;
    winC = #464646;
  }
  
  //walls
  fill(wallC);
  rect(0, 0, width, height/3*2);
  fill(floorC);
  rect(0, height/3*2, width, height);
  
  //windows
  for (int i = winX; i < width; i += winStep + winW) {
    int y = 100;
    noStroke();
    fill(winC);
    rect(i, winY, winW, winH);
    
    //glass
    for (int c = 1; c <= 2; c ++) {
      for (int r = 1; r <= 3; r ++) {
        if (mouseX > (i + c*glMar + (c-1)*glW) && mouseX < (i + c*glMar + (c-1)*glW) + glW && mouseY > (winY + r*glMar + (r-1)*glH) && mouseY < (winY + r*glMar + (r-1)*glH)+glH ) {
          if (night) {
          glC = #F5EEDA;
          } else if (!night) {
            glC = #2F3164;
          }
        } else {
          if (night) {
            glC = #525D79;
          } else if (!night) {
            glC = #CDEFF7;
          }
        }
        fill(glC);
        rect((i + c*glMar + (c-1)*glW), (winY + r*glMar + (r-1)*glH), glW, glH);
      }
    }

    //lights
    for (int x = 0; x <= 200; x+= 20) {
        stroke(0);
        if (night) {
          fill(random(255), random(255), 255);
        } else if (!night) {
          fill(#BFBFBF);
        }
        circle(i + x, y, 10);
        if (y > 100) {
          y -= 10;
        } else {
          y += 10;
        }
      }   
    }
  
  ////GRID
  //stroke(255,0,0, 50);
  //for (int c = 0; c < width; c+=100) {
  //  line(c, 0, c, height);
  //}
  //for (int r = 0; r < height; r+=100) {
  //  line(0, r, width, r);
  //}
}

void mousePressed() {
  night = !night;
}
