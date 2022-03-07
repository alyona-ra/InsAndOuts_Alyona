//Day by Alyona Radkevich

//Mouse click to force a daytime change
//Move the mouse vertically on the screen to change trees' colors

int margin = 50;
boolean dayState = false;
boolean stars = true;

int moonCenter = 500;
int moonSize = 200;

int fieldLeftW = 1000;
int fieldLeftH = 500;
int fieldRighttW = 1400;
int fieldRightH = 600;

int starNum = 30;
float[] starX = new float[starNum];
float[] starY = new float[starNum];

float speed = random(1);

color bg;
color fieldLeft;
color fieldRight;
color moon1;
color moon2;
color moon3;
color treeBottom = #463719;
color treeBottomStroke = #211B0F;
color tree1 = #486F41;
color tree2 = #325A28;
color tree3 = #4C9D3B;
color treeStroke = #181F17;

void setup() {
  size(1080, 720);
  
  for (int i = 0; i < starNum; i++) {
    starX[i] = random(margin, width - margin);
    starY[i] = random(margin, height/2);
  }
}

void draw() {
  noStroke();

  if (dayState) {
    bg = #BEF5F2;
    
    moon3 = color(#E3CA4E, 120);
    moon2 = color(#F5DD65, 160);
    moon1 = #FFEA71;
    
    fieldLeft = #82E576;
    fieldRight = #6FD862;
    
    stars = false;

  } else if (!dayState) {
    bg = #324067;
    
    moon3 = color(#EAEAD3, 60);
    moon2 = color(#E5E5BC, 150);
    moon1 = #E5E5AB;
    
    fieldLeft = #645DA2;
    fieldRight = #39347C;
    
    stars = true;
  }
  
  drawLandscape(bg, moon1, moon2, moon3, fieldLeft, fieldRight, stars);
  
}

void mousePressed() {
  dayState = !dayState;
}

void drawLandscape(color bg, color moon1, color moon2, color moon3, color fieldLeft, color fieldRight, boolean stars) {
  noStroke();
  background(bg);
  
  //moon
  fill(moon3);
  circle(moonCenter, moonCenter, 1.5 * moonSize);
  fill(moon2);
  circle(moonCenter, moonCenter, 1.25 * moonSize);
  fill(moon1);
  circle(moonCenter, moonCenter, moonSize);
  
  //fields
  fill(fieldLeft);
  ellipse(width / 20, height, fieldLeftW, fieldLeftH);
  fill(fieldRight);
  ellipse(width, height, fieldRighttW, fieldRightH);
  
  //stars, clouds
  if (stars) {
    stroke(255);
    strokeWeight(5);
    for (int i = 0; i < starNum; i++) {
      point(starX[i], starY[i]);
    }
  } else {
    fill(255);
    noStroke();
    ellipse(70+speed, 50, 100, 40);
    ellipse(200+speed, 70, 300, 60);
    ellipse(300+speed, 100, 200, 30);
    
    ellipse(370+speed*1.2, 300, 150, 40);
    ellipse(300+speed*1.2, 320, 400, 60);
    ellipse(200+speed*1.2, 350, 250, 30);
    
    ellipse(800+speed*0.95, 150, 60, 60);
    ellipse(700+speed*0.95, 170, 200, 60);
    ellipse(600+speed*0.95, 200, 200, 30);
    
    speed += 2;
    
    if (speed > width) {
      speed = -width;
    }
  }
  
  //trees (top)
  if (mouseY < height/3) {
    tree1 = #F7C58E;
    tree2 = #B2906C;
    tree3 = #D89144;
  } else if (mouseY < height/3*2) {
    tree1 = #769BD8;
    tree2 = #2254A7;
    tree3 = #C0D0EA;
  } else {
    tree1 = #955E5C;
    tree2 = #E88683;
    tree3 = #D8403B;
  }
  stroke(treeStroke);
  strokeWeight(2);
  fill(tree1);
  triangle(100, 600, 150, 400, 200, 600);
  
  strokeWeight(3);
  fill(tree2);
  triangle(950, 450, 970, 350, 990, 450);
  
  strokeWeight(4);
  fill(tree3);
  triangle(700, 500, 740, 300, 780, 500);
  
  //trees (bottom)
  strokeWeight(2);
  stroke(treeBottomStroke);
  fill(treeBottom);
  rect(140, 600, 20, 50);
  rect(965, 450, 10, 30);
  rect(730, 500, 20, 50);
 
}
