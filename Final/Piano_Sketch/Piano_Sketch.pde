// Mini Piano Simulator by Alyona Radkevich
// Play the same key on the physical piano as the one you see on the screen

import processing.serial.*;
import processing.sound.*;

byte val = 0;
int valR;

int whiteKeyW = 150;
int whiteKeyH = 550;
int whiteKeyX;
int whiteKeyY;

int blackKeyW = whiteKeyW/2;
int blackKeyH = whiteKeyH/2;
int blackKeyX;
int blackKeyY;

int whiteKeysNum = 8;
int blackKeysNum = 5;

String whiteKeys[] = {"C", "D", "E", "F", "G", "A", "B", "C2"};
String blackKeys[] = {"C#", "D#", "F#", "G#", "Bb"};
String allKeys[] = {"C", "D", "E", "F", "G", "A", "B", "C2"};

String currentKey;
String lastKey;

int lastKeyCode;

boolean pressed = false;
boolean showKeys = true;

color keyColor;
color fontColor;

String mode = "keys";
String randomKey;

int rightKeys = 0;
int score = 0;

SoundFile playKey;
SoundFile C;
SoundFile Cd;
SoundFile D;
SoundFile Dd;
SoundFile E;
SoundFile F;
SoundFile Fd;
SoundFile G;
SoundFile Gd;
SoundFile A;
SoundFile Bb;
SoundFile B;
SoundFile C2;

Serial myPort;

void setup() {
  frameRate(10);
  size(displayWidth, displayHeight); 
  //size(800, 500); 
  textAlign(CENTER);
  
  C = new SoundFile(this, "C.mp3");
  Cd = new SoundFile(this, "C#.mp3");
  D = new SoundFile(this, "D.mp3");
  Dd = new SoundFile(this, "D#.mp3");
  E = new SoundFile(this, "E.mp3");
  F = new SoundFile(this, "F.mp3");
  Fd = new SoundFile(this, "F#.mp3");
  G = new SoundFile(this, "G.mp3");
  Gd = new SoundFile(this, "G#.mp3");
  A = new SoundFile(this, "A.mp3");
  Bb = new SoundFile(this, "Bb.mp3");
  B = new SoundFile(this, "B.mp3");
  C2 = new SoundFile(this, "C2.mp3");
  
  randomKey = allKeys[(int)random(0, 8)];

  //printArray(Serial.list());
  String portName = Serial.list()[5];
  myPort = new Serial(this, portName, 9600);
  
}

void draw() {
  
  if ( myPort.available() > 0) {
    valR = myPort.read();
  }
  
  //background (#D7B4FF);
  background (200);
  //pressed = false;
  
  println("keyCode:", keyCode);
  println("pressed:", pressed, "|| currentKey:", currentKey, "|| lastKey:", lastKey);
  println("valR:", valR);
  
  lastKey = currentKey;
  lastKeyCode = keyCode;
  
  if (mode == "keys") {
    modeKeys();
  }
}

void modeKeys() {
  pressed = false;
  
  fill(#F91EFA);
  textSize(42);
  text("Play " + randomKey, width/2, 150);
  fill(#000000);
  textSize(24);
  text("You got " + rightKeys + " keys right in a row.",  width/4*3, 50);
  text("Current score " + score,  width/4*3, 80);
  
  if (rightKeys >= 10) {
    showKeys = false;
  }
  
  if (currentKey == randomKey) {
    randomKey = allKeys[(int)random(0, 8)];
    val = 21;
  }
  
  if (val == 21) {
    myPort.write(val);
    val = 22;
  } else if (val == 22) {
    myPort.write(val);
  }
  
  if (valR == 1) {
    pressed = true;
    currentKey = "C";
    C.play();
    valR = 0;
  } else if (valR == 2) {
    pressed = true;
    currentKey = "C#";
    Cd.play();
    valR = 0;
  } else if (valR == 3) {
    pressed = true;
    currentKey = "D";
    D.play();
    valR = 0;
  } else if (valR == 4) {
    pressed = true;
    currentKey = "D#";
    Dd.play();
    valR = 0;
  } else if (valR == 5) {
    pressed = true;
    currentKey = "E";
    E.play();
    valR = 0;
  } else if (valR == 6) {
    pressed = true;
    currentKey = "F";
    F.play();
    valR = 0;
  } else if (valR == 7) {
    pressed = true;
    currentKey = "F#";
    Fd.play();
    valR = 0;
  } else if (valR == 8) {
    pressed = true;
    currentKey = "G";
    G.play();
    valR = 0;
  } else if (valR == 9) {
    pressed = true;
    currentKey = "G#";
    Gd.play();
    valR = 0;
  } else if (valR == 10) {
    pressed = true;
    currentKey = "A";
    A.play();
    valR = 0;
  } else if (valR == 11) {
    pressed = true;
    currentKey = "Bb";
    Bb.play();
    valR = 0;
  } else if (valR == 12) {
    pressed = true;
    currentKey = "B";
    B.play();
    valR = 0;
  } else if (valR == 13) {
    pressed = true;
    currentKey = "C2";
    C2.play();
    valR = 0;
  }
  
  
  whiteKeyX = (width - (whiteKeysNum*whiteKeyW))/2;
  whiteKeyY = height/2 - whiteKeyH/2;
  for (int i = 0; i < whiteKeysNum; i++) {
    
    if (((mouseX > whiteKeyX && mouseX < whiteKeyX + whiteKeyW &&
    mouseY > whiteKeyY + blackKeyH && mouseY < whiteKeyY + whiteKeyH) ||
    (mouseX > whiteKeyX + (blackKeyW/2) && mouseX < whiteKeyX + whiteKeyW - (blackKeyW/2) &&
    mouseY > whiteKeyY && mouseY < whiteKeyY + blackKeyH))
    && mousePressed) {
      pressed = true;
      currentKey = whiteKeys[i];
    }
    
    if (pressed && currentKey == whiteKeys[i]) {
      if (currentKey == randomKey) {
        rightKeys++;
        score +=2;
        keyColor = #00FF00;
      } else if (currentKey != randomKey) {
        rightKeys = 0;
        showKeys = true;
        if (score > 0) {
          score--;
        }
        keyColor = #FF0000;
      }
      //keyColor = #FFF4A2;
      fontColor = #FF8E03;
    } else {
      keyColor = #FFFFFF;
      fontColor = #000000;
    }
    
    textSize(16);
    stroke(0);
    fill(keyColor);
    rect(whiteKeyX, whiteKeyY, whiteKeyW, whiteKeyH);
    if (showKeys) {
      fill(fontColor);
      text(whiteKeys[i], whiteKeyX+(whiteKeyW/2), whiteKeyY+whiteKeyH - 15);
    }
    
    whiteKeyX += whiteKeyW;
  }
  
  blackKeyX = (width - (whiteKeysNum*whiteKeyW))/2 + whiteKeyW - blackKeyW/2;
  blackKeyY = height/2 - whiteKeyH/2;
  for (int i = 0; i < blackKeysNum; i++) {
    
    if((mouseX > blackKeyX && mouseX < blackKeyX + blackKeyW &&
    mouseY > blackKeyY && mouseY < blackKeyY + blackKeyH) && mousePressed) {
      pressed = true;
      currentKey = blackKeys[i];
    }
    
    if (pressed && currentKey == blackKeys[i]) {
      if (currentKey == randomKey) {
        rightKeys++;
        score += 2;
        keyColor = #00FF00;
      } else if (currentKey != randomKey) {
        rightKeys = 0;
        showKeys = true;
        if (score > 0) {
          score--;
        }
        keyColor = #FF0000;
      }
      fontColor = #FF8E03;
    } else {
      keyColor = #000000;
      fontColor = #FFFFFF;
    }
    
    textSize(12);
    stroke(0);
    fill(keyColor);
    rect(blackKeyX, blackKeyY, blackKeyW, blackKeyH);
    //if (showKeys) {
    //  fill(fontColor);
    //  text(blackKeys[i], blackKeyX+(blackKeyW/2), blackKeyY+blackKeyH - 10);
    //}
    
    if (i == 1) {
      blackKeyX += whiteKeyW*2;
    } else {
      blackKeyX += whiteKeyW;
    }
  }
  
  if(!pressed) {
    currentKey = null;
  }
  
}

void modeNotation() {
  int lineY = 300;
  int noteX = 200;
  int noteY = 320;
  int noteW = 30;
  int noteH = 20;
  for (int i = 1; i <= 5; i++) {
    stroke(0);
    line(50, lineY, width-50, lineY);
    lineY -= noteH;
  }
  
  for (int i = 0; i < 8; i++) {
    if(i == 0) {
      line(noteX-25, noteY, noteX+25, noteY);
    }
    noStroke();
    fill(0);
    ellipse(noteX, noteY, noteW, noteH);
    textSize(16);
    text(whiteKeys[i], noteX, 370);
    noteX += noteW*2;
    noteY -= noteH/2;
  }

}
