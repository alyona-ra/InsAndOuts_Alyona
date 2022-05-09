import processing.serial.*;
import processing.sound.*;

byte val = 0;
int valR;

int whiteKeyW = 50;
int whiteKeyH = 150;
int whiteKeyX;
int whiteKeyY;

int blackKeyW = 25;
int blackKeyH = 75;
int blackKeyX;
int blackKeyY;

int whiteKeysNum = 8;
int blackKeysNum = 5;

String whiteKeys[] = {"C", "D", "E", "F", "G", "A", "B", "C2"};
String blackKeys[] = {"C#", "D#", "F#", "G#", "Bb"};
String whiteKeysKeys[] = {"S", "D", "F", "G", "H", "J", "K", "L"};
String blackKeysKeys[] = {"E", "R", "Y", "U", "I"};

String currentKey;
String lastKey;

int lastKeyCode;

boolean pressed = false;

color keyColor;
color fontColor;

String mode = "keys";

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
  size(800, 500); 
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
  
  lastKey = currentKey;
  lastKeyCode = keyCode;
  
  if (mode == "keys") {
    modeKeys();
  } else if (mode == "notation") {
    modeNotation();
  }
}

void mousePressed() {
  if (mode == "keys") {
    mode = "notation";
  } else if (mode == "notation") {
    mode = "keys";
  }

}

void modeKeys() {
  pressed = false;
  
  if (keyPressed) {
    if (key == 's' || key == 'S') {
      pressed = true;
      currentKey = "C";
    } else if (key == 'e' || key == 'E') {
      pressed = true;
      currentKey = "C#";
    } else if (key == 'd' || key == 'D') {
      pressed = true;
      currentKey = "D";
    } else if (key == 'r' || key == 'R') {
      pressed = true;
      currentKey = "D#";
    } else if (key == 'f' || key == 'F') {
      pressed = true;
      currentKey = "E";
    } else if (key == 'g' || key == 'G') {
      pressed = true;
      currentKey = "F";
    } else if (key == 'y' || key == 'Y') {
      pressed = true;
      currentKey = "F#";
    } else if (key == 'h' || key == 'H') {
      pressed = true;
      currentKey = "G";
    } else if (key == 'u' || key == 'U') {
      pressed = true;
      currentKey = "G#";
    } else if (key == 'j' || key == 'J') {
      pressed = true;
      currentKey = "A";
    } else if (key == 'i' || key == 'I') {
      pressed = true;
      currentKey = "Bb";
    } else if (key == 'k' || key == 'K') {
      pressed = true;
      currentKey = "B";
    } else if (key == 'l' || key == 'L') {
      pressed = true;
      currentKey = "C2";
    }  
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
      keyColor = #FFF4A2;
      fontColor = #FF8E03;
    } else {
      keyColor = #FFFFFF;
      fontColor = #000000;
    }
    
    stroke(0);
    fill(keyColor);
    rect(whiteKeyX, whiteKeyY, whiteKeyW, whiteKeyH);
    fill(fontColor);
    text(whiteKeysKeys[i], whiteKeyX+(whiteKeyW/2), whiteKeyY+whiteKeyH - 15);
    
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
      keyColor = #FFF4A2;
      fontColor = #FF8E03;
    } else {
      keyColor = #000000;
      fontColor = #FFFFFF;
    }
    
    stroke(0);
    fill(keyColor);
    rect(blackKeyX, blackKeyY, blackKeyW, blackKeyH);
    fill(fontColor);
    text(blackKeysKeys[i], blackKeyX+(blackKeyW/2), blackKeyY+blackKeyH - 10);
    
    if (i == 1) {
      blackKeyX += whiteKeyW*2;
    } else {
      blackKeyX += whiteKeyW;
    }
  }
  
  if(!pressed) {
    currentKey = null;
  }
  
  if ((currentKey == "C" && currentKey != lastKey)) {
    val = 1;
    myPort.write(val);
    //C.play();
  } else if ((currentKey == "C#" && currentKey != lastKey)) {
    val = 2;
    //myPort.write(val);
    Cd.play();
  } else if ((currentKey == "D" && currentKey != lastKey)) {
    val = 3;
    //myPort.write(val);
    D.play();
  } else if ((currentKey == "D#" && currentKey != lastKey)) {
    val = 4;
    //myPort.write(val);
    Dd.play();
  } else if ((currentKey == "E" && currentKey != lastKey)) {
    val = 5;
    //myPort.write(val);
    E.play();
  } else if ((currentKey == "F" && currentKey != lastKey)) {
    val = 6;
    //myPort.write(val);
    F.play();
  } else if ((currentKey == "F#" && currentKey != lastKey)) {
    val = 7;
    //myPort.write(val);
    Fd.play();
  } else if ((currentKey == "G" && currentKey != lastKey)) {
    val = 8;
    //myPort.write(val);
    G.play();
  } else if ((currentKey == "G#" && currentKey != lastKey)) {
    val = 9;
    //myPort.write(val);
    Gd.play();
  } else if ((currentKey == "A" && currentKey != lastKey)) {
    val = 10;
    //myPort.write(val);
    A.play();
  } else if ((currentKey == "Bb" && currentKey != lastKey)) {
    val = 11;
    //myPort.write(val);
    Bb.play();
  } else if ((currentKey == "B" && currentKey != lastKey)) {
    val = 12;
    //myPort.write(val);
    B.play();
  } else if ((currentKey == "C2" && currentKey != lastKey)) {
    val = 13;
    //myPort.write(val);
    C2.play();
  } else if (currentKey == null && currentKey != lastKey) {
    val = 0;
    //myPort.write(val);
  }
  
  if (valR == 1) {
    C.play();
    valR = 0;
  } else if (valR == 0) {
    //C.stop();
  }
  
  println("valR:", valR);
}

void modeNotation() {
  int lineY = 300;
  for (int i = 1; i <= 5; i++) {
    stroke(0);
    line(50, lineY, width-50, lineY);
    lineY -= 20;
  }
  
  int noteX = 200;
  int noteY = 320;
  for (int i = 1; i <= 8; i++) {
    if(i == 1) {
      line(175, 320, 225, 320);
    }
    noStroke();
    fill(0);
    ellipse(noteX, noteY, 30, 20);
    noteX += 60;
    noteY -= 10;
  }



}
