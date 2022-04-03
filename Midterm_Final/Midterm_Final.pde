String scene = "loading";
String failedLevel;
String finishedLevel;

Enemy e1;
Catchables catchables[] = new Catchables[10];

Grass grassArr[][] = new Grass[7][9];

int hx = 50;
int hy = 210;
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
boolean isStarted1 = true;
boolean isStarted3 = true;
boolean pressed = false;
boolean grassChecker = true;

int t1;
int t3;
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
PImage grassMess, grassClean, stone;
PImage bg_end, bg_start, bg_preEnd, bg_pre1, bg_pre2, bg_pre3;
PImage[] fish = new PImage[10];

PFont font1, font2;
String name1 = "FORREST";
String name2 = "GUMP";
String type;

int counter = 0;
int shrimpGoal = 5;

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
  deadline = loadImage("deadline.PNG");
  hook = loadImage("fish_hook.PNG");
  stone = loadImage("stone.PNG");
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
  bg_start = loadImage("bg_start.PNG");
  bg_preEnd = loadImage("bg_preEnd.PNG");
  bg_pre1 = loadImage("bg_pre1.PNG");
  bg_pre2 = loadImage("bg_pre2.PNG");
  bg_pre3 = loadImage("bg_pre3.PNG");
  
  font1 = createFont("CinzelDecorative-Bold.ttf", 48);
  font2 = createFont("Helvetica", 24);
  
  fish[0] = fish1;
  fish[1] = fish2;
  fish[2] = fish3;
  fish[3] = fish4;
  fish[4] = fish5;
  fish[5] = fish6;
  fish[6] = fish7;
  fish[7] = fish8;
  fish[8] = fish9;
  fish[9] = fish10;
  
  int shrimpCount = 0;
  for (int i = 0; i < catchables.length; i++) {
    float randomType = random(1);
    if (randomType > 0.6) {
      catchables[i] = new Catchables(shrimp.width, shrimp.height, shrimp, "shrimp");
    } else {
      int a = (int)random(10);
      catchables[i] = new Catchables(fish[a].width, fish[a].height, fish[a], "fish");
    }
    if (catchables[i].currentType == "shrimp") {
      shrimpCount++;
    }
  }

  for (int i = 0; i < catchables.length; i++) {
    if (shrimpCount < 2) {
      if (catchables[i].currentType != "shrimp") {
        catchables[i] = new Catchables(shrimp.width, shrimp.height, shrimp, "shrimp");
        shrimpCount++;
      }
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
  } else if (scene == "gameStart") {
    gameStart();
  } else if (scene == "preLvl1") {
    preLvl1();
  } else if (scene == "preLvl2") {
    preLvl2();
  } else if (scene == "preLvl3") {
    preLvl3();
  } else if (scene == "preEnd") {
    preEnd();
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
  
  if (isStarted1) {
    t1 = currentT;
    isStarted1 = false;
  }
  
  if (currentT - t1 > delay) {
        e1.x += 2.5;
  }
  
  if (gx > width) {
    finishedLevel = scene;
    levelWin(finishedLevel);
  } else if (gx <= e1.x + e1.w - 30) {
    failedLevel = scene;
    resetLevel(failedLevel);
  }
}

void lvl2() {
  background(bg_lvl2);
  image(hook, hx, hy);
  stroke(0);
  strokeWeight(1);
  line(58, 210, 58, hy);
  
  for (int i = 0; i < catchables.length; i++) {
    catchables[i].display();
    catchables[i].x -= catchables[i].speed;
    if (catchables[i].x < 0 - catchables[i].w) {
      catchables[i].x = random(width, width*1.5);
      catchables[i].y = random(hy+hh, height-catchables[i].h);
      if (catchables[i].currentType == "fish") {
        catchables[i].changeFish(fish[(int)random(fish.length)]);
      }
    }
    
    if(hitCatchable(catchables[i]) && catchables[i].currentType == "fish"){
      failedLevel = scene;
      resetLevel(failedLevel);
      break;
    } else if(hitCatchable(catchables[i]) && catchables[i].currentType == "shrimp") {
      catchables[i].x = random(width, width*2);
      catchables[i].y = random(hy+hh, height-catchables[i].h);
      counter++;
    } else if(!hitCatchable(catchables[i]) && catchables[i].x < width - catchables[i].w) {
      
    }
  } 
  
  if (counter == shrimpGoal) {
    finishedLevel = scene;
    levelWin(finishedLevel);
  }
  image(shrimp, 145, 23, 38, 21);
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
  
  if (isStarted3) {
    t3 = currentT;
    isStarted3 = false;
  }
  
  boolean stop = false;
  for (int r = 0; r < 9; r++) {
    for (int c = 0; c < 7; c++) {
      grassArr[c][r].display();
      grassArr[c][r].check(ggx, ggy);
      
     if (grassArr[c][r].hasStone && 
     (ggx == grassArr[c][r].x*grassArr[c][r].w && 
     ggy + ggw == grassArr[c][r].y*grassArr[c][r].w + grassArr[c][r].w +250)) {
       stop = true;
     }
    }
  }
  
  if (currentT - t3 > delay) {
    int stoneCounter = 5;
    t3 = currentT;
    for (int r = 0; r < 9; r++) {
      for (int c = 0; c < 7; c++) {
        if (stoneCounter > 0 && random(1) > 0.9 && !(r < 8 && grassArr[c][r+1].passed && !grassArr[c][r].passed) ) {
          grassArr[c][r].setStone(true);
          stoneCounter--;
        } else {
          grassArr[c][r].setStone(false);
        }
        grassArr[0][8].setStone(false);
      }
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
    finishedLevel = scene;
    levelWin(finishedLevel);
  }

  image(gump_grass_r, ggx, ggy, ggw, ggh);
  
  if (ggy + ggh < height) {
    if (ggx < 0 - ggw) {
      ggx = width - ggw/2;
      ggy+=50;
    }
  }
  
  if(stop) {
    failedLevel = scene;
    resetLevel(failedLevel);
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

void levelWin(String finishedLevel) {
  if(finishedLevel == "lvl1") {
    scene = "preLvl2";
  } else if(finishedLevel == "lvl2") {
    scene = "preLvl3";
  } else if(finishedLevel == "lvl3") {
    scene = "preEnd";
  }
}

void gameStart() {
  image(bg_start, 0, 0);
}

void preLvl1() {
  image(bg_pre1, 0, 0);
}

void preLvl2() {
  image(bg_pre2, 0, 0);
}

void preLvl3() {
  image(bg_pre3, 0, 0);
}

void preEnd() {
  image(bg_preEnd, 0, 0);
}

void gameEnd() {
  image(bg_end, 0, 0);
  textFont(font1);
  fill(255);
  text(name1, 180, 150);
  text(name2, 300, 220);
}


void keyReleased() {
  if (scene == "loading") {
    if (keyCode == RETURN || keyCode ==  ENTER) {
      scene = "gameStart";
    }
  } else if (scene == "gameStart") {
    if (keyCode == RETURN || keyCode ==  ENTER) {
      scene = "preLvl1";
    }
  } else if (scene == "preLvl1") {
    if (keyCode == RETURN || keyCode ==  ENTER) {
      scene = "lvl1";
    }
  } else if (scene == "preLvl2") {
    if (keyCode == RETURN || keyCode ==  ENTER) {
      scene = "lvl2";
    }
  } else if (scene == "preLvl3") {
    if (keyCode == RETURN || keyCode ==  ENTER) {
      scene = "lvl3";
    }
  } else if (scene == "lvl1") {
    if ((keyCode == RIGHT || keyCode == 68) && gx < width) {
      gt += 0.5;
      ga += 0.1;
      gx += gt*ga;
    }
  } else if (scene == "lvl1_failed") {
    if (keyCode == 82) {
      isStarted1 = true;
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
        catchables[i].y = random(hy+hh, height-catchables[i].h);
      }
      counter = 0;
    }
  } else if (scene == "lvl3_failed") {
    if (keyCode == 82) {
      scene = "lvl3";
      ggx = 400;
      ggy = 200;
      for (int r = 0; r < 9; r++) {
        for (int c = 0; c < 7; c++) {
          grassArr[c][r].passed = false;
        }
      }
      isStarted3 = true;
     
      
    }
  } else if (scene == "preEnd") {
    if (keyCode == RETURN || keyCode ==  ENTER) {
      scene = "gameEnd";
    } else if (keyCode == 32) {
      scene = "gameStart";
    }
    isStarted1 = true;
    gx = 50;
    gs = 100;
    ga = 0.1;
    gt = 0;
    e1.x = -e1.w;
    hx = 50;
    hy = 210;
    for (int i = 0; i < catchables.length; i++) {
      catchables[i].x = random(width, width*2);
      catchables[i].y = random(hy+hh, height-catchables[i].h);
    }
    counter = 0;
    
    ggx = 400;
    ggy = 200;
    for (int r = 0; r < 9; r++) {
      for (int c = 0; c < 7; c++) {
        grassArr[c][r].passed = false;
      }
    }
  }
}

void keyPressed() {
  if (scene == "lvl2") {
    if ((keyCode == UP || keyCode == 87) && hy > 210) {
      hy-=10;
    } else if ((keyCode == DOWN || keyCode == 83)  && hy < height - hh) {
      hy+=20;
    }
  }
  if (scene == "lvl3") {
    if ((keyCode == LEFT || keyCode == 65)) {
      ggx-=25;
    }
  }
}
