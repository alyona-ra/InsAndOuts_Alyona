String scene = "lvl3";
String failedLevel;

Enemy e1;
Catchables catchables[] = new Catchables[10];

Grass grassArr[][] = new Grass[7][9];

int hx = 50;
int hy = 200;
int hw = 20;
int hh = 50;

float gx = 50;
float gy = 380;
float gw = 100;
float gh = 170;

float gs = 100;
float ga = 0.1;
float gt = 0;

int ggx = 400;
int ggy = 200;
int ggw = 100;
int ggh = 100;

boolean right = false;
boolean isStarted = true;
boolean pressed = false;
boolean grassChecker = true;

int t;
int currentT;
int delay = 2000;

color bg, sunC, textC;

int sunX = 420;
int sunY = 150;
int sunW = 200;

int spS, spB, sp1, sp2, sp3, sp4, sp5, sp6, sp7, sp8;

PImage bottom, bg1, bg2, bg3, bg4, bg5, bg6, bg7, bg8, gump;
PImage bg_lvl1, bg_lvl2, bg_lvl3, gump_running, gump_grass, gump_grass_r, deadline, hook;
PImage fish1, fish2, fish3, fish4, fish5, fish6, fish7, fish8, fish9, fish10, shrimp;
PImage grassMess, grassClean;
PImage bg_end;

PFont font1, font2;
String name1 = "RFORREST";
String name2 = "GUMP";
String type;

int counter = 0;
int shrimpGoal = 10;

void setup() {
  size(450, 600);
  textAlign(CENTER);
  
  e1 = new Enemy();
  
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
  bg_lvl1 = loadImage("bg_lvl1.PNG");
  bg_lvl2 = loadImage("bg_lvl2.PNG");
  bg_lvl3 = loadImage("bg_lvl3.PNG");
  gump_running = loadImage("gump_running.PNG");
  deadline = loadImage("deadline3.PNG");
  hook = loadImage("fish_hook.PNG");
  
  shrimp = loadImage("shrimp.PNG");
  fish1 = loadImage("fish1.PNG");
  fish2 = loadImage("fish2.PNG");
  fish3 = loadImage("fish3.PNG");
  fish4 = loadImage("fish4.PNG");
  fish5 = loadImage("fish5.PNG");
  fish6 = loadImage("fish6.PNG");
  fish7 = loadImage("fish7.PNG");
  fish8 = loadImage("fish8.PNG");
  fish9 = loadImage("fish9.PNG");
  fish10 = loadImage("fish10.PNG");
  
  grassMess = loadImage("grass_mess.PNG");
  grassClean = loadImage("grass_clean.PNG");
  gump_grass = loadImage("gump_grass.PNG");
  gump_grass_r = loadImage("gump_grass_r.PNG");
  
  bg_end = loadImage("bg_end.PNG");
  
  font1 = createFont("CinzelDecorative-Bold.ttf", 48);
  font2 = createFont("Helvetica", 24);
  
  PImage[] fish = {fish1, fish2, fish3, fish4, fish5, fish6, fish7, fish8, fish9, fish10};
  
  for (int i = 0; i < catchables.length; i++) {
    float randomType = random(1);
    if (randomType > 0.6) {
      catchables[i] = new Catchables(shrimp.width, shrimp.height, shrimp, "shrimp");
    } else {
      int a = (int)random(10);
      catchables[i] = new Catchables(fish[a].width, fish[a].height, fish[a], "fish");
    }
  }
  
  for (int r = 0; r < 9; r++) {
    for (int c = 0; c < 7; c++) {
      grassArr[c][r] = new Grass(r, c);
    }
  }
  
}

void draw() {
  currentT = millis();
  if (scene == "loading") {
    loadingScreen();
  } else if (scene == "lvl1") {
    lvl1();
  } else if (scene == "lvl2") {
    lvl2();
  } else if (scene == "lvl3") {
    lvl3();
  } else if (scene == "gameEnd") {
    gameEnd();
  }
}

void mousePressed() {
  if (scene == "loading") {
    pressed = !pressed;
  }
} 

void lvl1() {
  background(bg_lvl1);
  image(gump_running, gx, gy, gw, gh);
  e1.display();
  
  if (isStarted) {
    t = currentT;
    isStarted = false;
  }
  
  if (currentT - t > delay) {
        e1.x += 2.5;
  }
  
  if (gx > width) {
    scene = "lvl2";
  } else if (gx <= e1.x + e1.w - 30) {
    failedLevel = scene;
    resetLevel(failedLevel);
  }
}

void lvl2() {
  background(bg_lvl2);
  image(hook, hx, hy);
  
  for (int i = 0; i < catchables.length; i++) {
    catchables[i].display();
    catchables[i].x -= catchables[i].speed;
    if (catchables[i].x < 0 - catchables[i].w) {
      catchables[i].x = random(width, width*1.5);
      catchables[i].y = random(250, height - 50);
    }
    
    if(hitCatchable(catchables[i]) && catchables[i].currentType == "fish"){
      failedLevel = scene;
      resetLevel(failedLevel);
    } else if(hitCatchable(catchables[i]) && catchables[i].currentType == "shrimp") {
      catchables[i].x = random(width, width*2);
      catchables[i].y = random(250, height);
      counter++;
    } else if(!hitCatchable(catchables[i]) && catchables[i].x < width - catchables[i].w) {
      
    }
  } 
  
  if (counter == shrimpGoal) {
    scene = "lvl3";
  }
  image(shrimp, 140, 20, 38, 21);
  textSize(24);
  fill(0);
  text(": " + counter + " / " + shrimpGoal, width/2, 40);
}

boolean hitCatchable(Catchables catchable) {
  if(hx + hw > catchable.x && 
    hx < catchable.x + catchable.w && 
    hy + hh > catchable.y && 
    hy + hh/3 < catchable.y + catchable.h) {
      return true;
    }
    return false;
}

void lvl3() {
  background(bg_lvl3);
  
  for (int r = 0; r < 9; r++) {
    for (int c = 0; c < 7; c++) {
      grassArr[c][r].display();
      grassArr[c][r].check(ggx, ggy);
    }
  }
  
  grassChecker = true;
  
  for (int r = 0; r < 9; r++) {
    for (int c = 0; c < 7; c++) {
      if (grassArr[c][r].passed == false) {
        grassChecker = false;
      }
    }
  }
  
  if (grassChecker == true) {
    scene = "gameEnd";
  }

  image(gump_grass_r, ggx, ggy, ggw, ggh);
  
  if (ggy + ggh < height) {
    if (ggx < 0 - ggw) {
      ggx = width - ggw/2;
      ggy+=50;
    }
  }
  
}

void resetLevel(String failedLevel) {
  if(failedLevel == "lvl1") {
    scene = "lvl1_failed";
  } else if(failedLevel == "lvl2") {
    scene = "lvl2_failed";
  } else if(failedLevel == "lvl3") {
    scene = "lvl3_failed";
  }
  
  fill(0, 0, 0, 150);
  rect(0, 0, width, height);
  fill(255);
  textSize(18);
  textFont(font2);
  text("GAME OVER", width/2, height/2);
  text("Press R to Restart", width/2, height/2 + 30);

}

void gameEnd() {
  image(bg_end, 0, 0);
  textSize(20);
  text("Press SPACEBAR to RESTART the game", width/2, 100);
}


void keyReleased() {
  if (scene == "loading") {
    if (keyCode == RETURN || keyCode ==  ENTER) {
      scene = "lvl1";
      //lvl1();
    }
  } else if (scene == "lvl1") {
    if ((keyCode == RIGHT || keyCode == 68) && gx < width) {
      gt += 0.5;
      ga += 0.1;
      gx += gt*ga;
    }
  } else if (scene == "lvl1_failed") {
    if (keyCode == 82) {
      isStarted = true;
      scene = "lvl1";
      gx = 50;
      gs = 100;
      ga = 0.1;
      gt = 0;
      e1.x = -e1.w;
     }
  } else if (scene == "lvl2_failed") {
    if (keyCode == 82) {
      scene = "lvl2";
      hx = 50;
      hy = 200;
      for (int i = 0; i < catchables.length; i++) {
        catchables[i].x = random(width, width*2);
        catchables[i].y = random(250, height);
      }
      counter = 0;
    }
  } else if (scene == "gameEnd") {
    if (keyCode == 32) {
      scene = "loading";
      isStarted = true;
      gx = 50;
      gs = 100;
      ga = 0.1;
      gt = 0;
      e1.x = -e1.w;
      hx = 50;
      hy = 200;
      for (int i = 0; i < catchables.length; i++) {
        catchables[i].x = random(width, width*2);
      }
      counter = 0;
      
      for (int r = 0; r < 9; r++) {
        for (int c = 0; c < 7; c++) {
          grassArr[c][r].passed = false;
        }
      }
    }
  }
}

void keyPressed() {
  if (scene == "lvl2") {
    if ((keyCode == RIGHT || keyCode == 68) && hx < width - hw) {
      hx+=10;
    } else if ((keyCode == LEFT || keyCode == 65) && hx > 0) {
      hx-=10;
    } else if ((keyCode == UP || keyCode == 87) && hy > 0) {
      hy-=10;
    } else if ((keyCode == DOWN || keyCode == 83)  && hy < height - hh) {
      hy+=10;
    }
  }
  
  //if (scene == "lvl3") {
  //  if ((keyCode == RIGHT || keyCode == 68) && ggx + ggw < width) {
  //    ggx+=25;
  //  } else if ((keyCode == LEFT || keyCode == 65) && ggx > 0) {
  //    ggx-=25;
  //  } else if ((keyCode == UP || keyCode == 87) && ggy > 0) {
  //    ggy-=25;
  //  } else if ((keyCode == DOWN || keyCode == 83)  && ggy < height - ggh) {
  //    ggy+=25;
  //  }
  //}
  if (scene == "lvl3") {
    if ((keyCode == LEFT || keyCode == 65)) {
      ggx-=25;
    }
  }
}
