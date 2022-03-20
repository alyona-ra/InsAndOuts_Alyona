int state = 0;

Enemy e1;
Catchables catchables[] = new Catchables[10];
Grass grass;

float rx = 100;
float ry = 400;
float rw = 50;

float rs = 100;
float ra = 0.1;
float rt = 0;

boolean right = false;
boolean isStarted = true;

int t;
int currentT;
int delay = 2000;

color bg, sunC, textC;

int sunX = 420;
int sunY = 150;
int sunW = 200;

int spS, spB, sp1, sp2, sp3, sp4, sp5, sp6, sp7, sp8;

PImage bottom, bg1, bg2, bg3, bg4, bg5, bg6, bg7, bg8, gump;

PFont font;
String name1 = "FORREST";
String name2 = "GUMP";

boolean pressed = false;

int counter = 0;

void setup() {
  size(450, 600);
  
  e1 = new Enemy();
  grass = new Grass();
  
  for (int i = 0; i < catchables.length; i++) {
    float type = random(1);
    catchables[i] = new Catchables(type);
  }
  
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
  currentT = millis();
  if (state == 0) {
    //menu();
    loadingScreen();
  } else if (state == 1) {
    state1();
  } else if (state == 2) {
    state2();
  } else if (state == 3) {
    state3();
  } else if (state == -1) {
    gameOver();
  }
  
  //println("currentT: ", currentT);
  //println("t: ", t);
}

void mousePressed() {
  if (state == 0) {
    pressed = !pressed;
  }
} 

void state1() {
  background(24, 124, 153);
  fill(255);
  rect(rx, ry, rw, rw);
  e1.display();
  
  if (isStarted) {
    t = currentT;
    isStarted = false;
  }
  
  if (currentT - t > delay) {
        e1.x += 2.5;
  }
  
  if (rx > width) {
    state = 2;
  } else if (rx <= e1.x + e1.w) {
    state = -1;
  }
}

void state2() {
  background(64, 12, 210);
  fill(255);
  rect(rx, ry, rw, rw);
  //keyPressed();
  
  for (int i = 0; i < catchables.length; i++) {
    catchables[i].display();
    catchables[i].x++;
    if (catchables[i].x > width) {
      catchables[i].x = random(-width);
      catchables[i].y = random(200, height);
    }
    
    //hitCatchable(catchables[i]);
    
    if(rx + rw > catchables[i].x && 
    rx < catchables[i].x + catchables[i].w && 
    ry + rw > catchables[i].y && 
    ry < catchables[i].y + catchables[i].h &&
    catchables[i].currentType <= 0.7) {
      state = -1;
    } else if(rx + rw > catchables[i].x && 
    rx < catchables[i].x + catchables[i].w && 
    ry + rw > catchables[i].y && 
    ry < catchables[i].y + catchables[i].h &&
    catchables[i].currentType > 0.7) {
      catchables[i].x = random(-width);
      catchables[i].y = random(200, height);
      counter++;
    }
  } 
  
  if (counter == 5) {
    state = 3;
  }
  println("Counter: ", counter);
}

//boolean hitCatchable(Catchables catchable) {
//  if(rx + rw > catchables.x && 
//    rx < catchables.x + catchables.w && 
//    ry + rw > catchables.y && 
//    ry < catchables.y + catchables.h) {
//      return true;
//    }
//    return false;
//}

void state3() {
  background(0, 255, 0);
  
  for (int r = 0; r < 8; r++) {
    for (int c = 0; c < 12; c++) {
      grass.display(r, c);
    }
  }
  
  fill(255);
  rect(rx, ry, rw, rw);
  
  //if(rx > grass.x) {
    
  //}
}


void gameOver() {
  background(20);
  textAlign(CENTER);
  fill(255);
  textSize(24);
  text("GAME OVER", width/2, height/2);
  text("Press R to Restart", width/2, height/2 + 30);

}


void keyReleased() {
  if (state == 0) {
    if (keyCode == RETURN || keyCode ==  ENTER) {
      state = 1;
    }
  } else if (state == 1) {
    if ((keyCode == RIGHT || keyCode == 68) && rx < width) {
      rt += 0.5;
      ra += 0.1;
      rx += rt*ra;
    }
  } else if (state == -1) {
    if (keyCode == 82) {
      isStarted = true;
      state = 1;
      rx = 100;
      rs = 100;
      ra = 0.1;
      rt = 0;
      e1.x = 20;
    }
  }
}

void keyPressed() {
  if (state == 2 || state == 3) {
    if ((keyCode == RIGHT || keyCode == 68) && rx < width - rw) {
      rx+=25;
    } else if ((keyCode == LEFT || keyCode == 65) && rx > 0) {
      rx-=25;
    } else if ((keyCode == UP || keyCode == 87) && ry > 0) {
      ry-=25;
    } else if ((keyCode == DOWN || keyCode == 83)  && ry < height - rw) {
      ry+=25;
    }
  }
}
