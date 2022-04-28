//Simple Piano by Alyona Radkevich

//Press assigned keys on the keyboard or click on the virtual piano key.

import processing.serial.*;
byte val = 0;

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

Serial myPort;

void setup() {
  frameRate(10);
  size(800, 500); 
  textAlign(CENTER);

  //printArray(Serial.list());
  String portName = Serial.list()[5];
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  background (#D7B4FF);
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
  } else if ((currentKey == "C#" && currentKey != lastKey)) {
    val = 2;
    myPort.write(val);
  } else if ((currentKey == "D" && currentKey != lastKey)) {
    val = 3;
    myPort.write(val);
  } else if ((currentKey == "D#" && currentKey != lastKey)) {
    val = 4;
    myPort.write(val);
  } else if ((currentKey == "E" && currentKey != lastKey)) {
    val = 5;
    myPort.write(val);
  } else if ((currentKey == "F" && currentKey != lastKey)) {
    val = 6;
    myPort.write(val);
  } else if ((currentKey == "F#" && currentKey != lastKey)) {
    val = 7;
    myPort.write(val);
  } else if ((currentKey == "G" && currentKey != lastKey)) {
    val = 8;
    myPort.write(val);
  } else if ((currentKey == "G#" && currentKey != lastKey)) {
    val = 9;
    myPort.write(val);
  } else if ((currentKey == "A" && currentKey != lastKey)) {
    val = 10;
    myPort.write(val);
  } else if ((currentKey == "Bb" && currentKey != lastKey)) {
    val = 11;
    myPort.write(val);
  } else if ((currentKey == "B" && currentKey != lastKey)) {
    val = 12;
    myPort.write(val);
  } else if ((currentKey == "C2" && currentKey != lastKey)) {
    val = 13;
    myPort.write(val);
  } else if (currentKey == null && currentKey != lastKey) {
    val = 0;
    myPort.write(val);
  }
  
  println(keyCode);
  println("pressed:", pressed, "|| currentKey:", currentKey, "|| lastKey:", lastKey);
  
  lastKey = currentKey;
  lastKeyCode = keyCode;
}
