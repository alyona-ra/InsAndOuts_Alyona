// Mini Piano Simulator by Alyona Radkevich

int LED13 = 13;

int buttonC = 9;
int buttonCd = A1;
int buttonD = 8;
int buttonDd = A2;
int buttonE = 7;
int buttonF = 6;
int buttonFd = A3;
int buttonG = 5;
int buttonGd = A4;
int buttonA = 4;
int buttonBb = A5;
int buttonB = 3;
int buttonC2 = 2;

int stateC = 0;
int stateCd = 0;
int stateD = 0;
int stateDd = 0;
int stateE = 0;
int stateF = 0;
int stateFd = 0;
int stateG = 0;
int stateGd = 0;
int stateA = 0;
int stateBb = 0;
int stateB = 0;
int stateC2 = 0;

boolean pressed;

String pianoKeyVal;
String lastPianoKeyVal;
int valR;
byte valS;

void setup() {
  // put your setup code here, to run once:
  pinMode(LED13, OUTPUT);
  
  pinMode(buttonC, INPUT);
  pinMode(buttonCd, INPUT);
  pinMode(buttonD, INPUT);
  pinMode(buttonDd, INPUT);
  pinMode(buttonE, INPUT);
  pinMode(buttonF, INPUT);
  pinMode(buttonFd, INPUT);
  pinMode(buttonG, INPUT);
  pinMode(buttonGd, INPUT);
  pinMode(buttonA, INPUT);
  pinMode(buttonBb, INPUT);
  pinMode(buttonB, INPUT);
  pinMode(buttonC2, INPUT);
  
  Serial.begin(9600);
}

void loop() {

  if (Serial.available()) {
    valR = Serial.read();
    delay (1);
  }
  
  stateC = digitalRead(buttonC);
  stateCd = digitalRead(buttonCd);
  stateD = digitalRead(buttonD);
  stateDd = digitalRead(buttonDd);
  stateE = digitalRead(buttonE);
  stateF = digitalRead(buttonF);
  stateFd = digitalRead(buttonFd);
  stateG = digitalRead(buttonG);
  stateGd = digitalRead(buttonGd);
  stateA = digitalRead(buttonA);
  stateBb = digitalRead(buttonBb);
  stateB = digitalRead(buttonB);
  stateC2 = digitalRead(buttonC2);
  
  pressed = false;

  if (!pressed) {
    pianoKeyVal = "none";
  }

  if (stateC == HIGH) {
    pressed = true;
    pianoKeyVal = "C";
    delay(100);
  } else if (stateD == HIGH) {
//    pressed = true;
    pianoKeyVal = "D";
    delay(100);
  } else if (stateE == HIGH) {
//    pressed = true;
    pianoKeyVal = "E";
    delay(100);
  } else if (stateF == HIGH) {
//    pressed = true;
    pianoKeyVal = "F";
    delay(100);
  } else if (stateG == HIGH) {
//    pressed = true;
    pianoKeyVal = "G";
    delay(100);
  } else if (stateA == HIGH) {
//    pressed = true;
    pianoKeyVal = "A";
    delay(100);
  } else if (stateB == HIGH) {
//    pressed = true;
    pianoKeyVal = "B";
    delay(100);
  } else if (stateC2 == HIGH) {
//    pressed = true;
    pianoKeyVal = "C2";
    delay(100);
  } else {
    pressed = false;
    pianoKeyVal = "none";
    delay(100);
  }

  if (valR == 21) {
    digitalWrite(LED13, HIGH);
  } else {
    digitalWrite(LED13, LOW);
  }
  
  if (pianoKeyVal == "C" && pianoKeyVal != lastPianoKeyVal) {
    valS = 1;
    Serial.write(valS);
  } else if (pianoKeyVal == "Cd" && pianoKeyVal != lastPianoKeyVal) {
    valS = 2;
    Serial.write(valS);
  } else if (pianoKeyVal == "D" && pianoKeyVal != lastPianoKeyVal) {
    valS = 3;
    Serial.write(valS);
  } else if (pianoKeyVal == "Dd" && pianoKeyVal != lastPianoKeyVal) {
    valS = 4;
    Serial.write(valS);
  } else if (pianoKeyVal == "E" && pianoKeyVal != lastPianoKeyVal) {
    valS = 5;
    Serial.write(valS);
  } else if (pianoKeyVal == "F" && pianoKeyVal != lastPianoKeyVal) {
    valS = 6;
    Serial.write(valS);
  } else if (pianoKeyVal == "Fd" && pianoKeyVal != lastPianoKeyVal) {
    valS = 7;
    Serial.write(valS);
  } else if (pianoKeyVal == "G" && pianoKeyVal != lastPianoKeyVal) {
    valS = 8;
    Serial.write(valS);
  } else if (pianoKeyVal == "Gd" && pianoKeyVal != lastPianoKeyVal) {
    valS = 9;
    Serial.write(valS);
  } else if (pianoKeyVal == "A" && pianoKeyVal != lastPianoKeyVal) {
    valS = 10;
    Serial.write(valS);
  } else if (pianoKeyVal == "Bb" && pianoKeyVal != lastPianoKeyVal) {
    valS = 11;
    Serial.write(valS);
  } else if (pianoKeyVal == "B" && pianoKeyVal != lastPianoKeyVal) {
    valS = 12;
    Serial.write(valS);
  } else if (pianoKeyVal == "C2" && pianoKeyVal != lastPianoKeyVal) {
    valS = 13;
    Serial.write(valS);
  } else if (pianoKeyVal == "none" && pianoKeyVal != lastPianoKeyVal) {
    valS = 0;
    Serial.write(valS);
//    Serial.println(valS);
//    Serial.println("Last Key: " + lastPianoKeyVal);
//    Serial.println( "Current Key: " + pianoKeyVal);
  }

//  Serial.println("Last Key: " + lastPianoKeyVal);
//  Serial.println( "Current Key: " + pianoKeyVal);

  lastPianoKeyVal = pianoKeyVal;
  
  

//  Serial.println(state);
}
