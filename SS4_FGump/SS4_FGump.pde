//Forrest Gump by Alyona Radkevich

//Press ENTER / RETURN to see how long Forrest Gump had been running.

color bg;
color sunC;
color textC;

int sunX = 420;
int sunY = 150;
int sunW = 200;

int spS;
int spB;
int sp1;
int sp2;
int sp3;
int sp4;
int sp5;
int sp6;
int sp7;
int sp8;

PImage bottom;
PImage bg1;
PImage bg2;
PImage bg3;
PImage bg4;
PImage bg5;
PImage bg6;
PImage bg7;
PImage bg8;
PImage gump;

PFont font;
String name1 = "FORREST";
String name2 = "GUMP";

boolean pressed = false;

void setup() {
  size(450,600);
  bottom = loadImage("bgBottom.PNG");
  bg1 = loadImage("bg1.PNG");
  bg2 = loadImage("bg2.PNG");
  bg3 = loadImage("bg3.PNG");
  bg4 = loadImage("bg4.PNG");
  bg5 = loadImage("bg5.PNG");
  bg6 = loadImage("bg6.PNG");
  bg7 = loadImage("bg7.PNG");
  bg8 = loadImage("bg8.PNG");
  gump = loadImage("gump.PNG");
  font = createFont("CinzelDecorative-Bold.ttf", 48);
}

void draw() {
  background(bg);
  
  image(bg4, -60+sp4, 0);
  image(bg6, 110+sp6, 0);
  
  noStroke();
  fill(sunC);
  circle(sunX-spS, sunY, sunW);
  spS += 3;
  if (-spS + sunX  < - sunW) {
    spS =  - width + sunX - sunW/2;
  }
  
  image(bg1, 80+sp1, 0);
  image(bg2, -180+sp2, 0);
  image(bg3, 200+sp3, 0);
  image(bg5, -150+sp5, 0);
  image(bg7, -250+sp7, 0);
  image(bg8, 70+sp8, 0);
  image(bottom, 0 - spB, 0);
  
  image(gump, 0, 0);
  
  if (pressed) {
    textC = #e1825c;
    bg = #19021f;
    sunC = #ffffff;
  } else if (!pressed) {
    textC = #19021f;
    bg = #f8c0c3;
    sunC = #eb6661;
  }
  fill(textC);
  textFont(font);
  text(name1, 80, 100);
  text(name2, 220, 150);
  
  sp1 += 3;
  sp2 += 3;
  sp3 += 3;
  sp4 += 3;
  sp5 += 3;
  sp6 += 3;
  sp7 += 3;
  sp8 += 3;
  spB += 3;
  
  if (spB > width) {
    spB = -width;
  }
  
  if (sp1 + 80 > width) {
    sp1 = -80  - width;
  } else if (sp2 - 180 > width) {
    sp2 = 180  - width;
  } else if (sp3 + 200 > width) {
    sp3 = - 200 - width;
  } else if (sp4 - 80 > width) {
    sp4 = 80  - width;
  } else if (sp5 - 150 > width) {
    sp5 = 150  - width;
  } else if (sp6 + 110 > width) {
    sp6 = -110  - width;
  } else if (sp7 - 250 > width) {
    sp7 = 250  - width;
  } else if (sp8 + 70 > width) {
    sp8 = -70  - width;
  }
  
}

void keyPressed() {
  if (key == ENTER || key == RETURN) {
    pressed = !pressed;
  }
}
