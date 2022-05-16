int LED13 = 13;
int LED12 = 12;

int buttonC = 2;
int buttonCd = A5;
int buttonD = 3;
int buttonDd = A4;
int buttonE = 4;
int buttonF = 5;
int buttonFd = A3;
int buttonG = 6;
int buttonGd = A2;
int buttonA = 7;
int buttonBb = A1;
int buttonB = 8;
int buttonC2 = 9;

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
  pinMode(LED12, OUTPUT);
  
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
//    digitalWrite(LED13, HIGH);
//    digitalWrite(LED12, LOW);
    pianoKeyVal = "C";
    delay(100);
//    lastPianoKeyVal = pianoKeyVal;
//    Serial.write(1);
//    Serial.println(1);
  } else if (stateCd == HIGH) {
    pianoKeyVal = "Cd";
    delay(100);
  } else if (stateD == HIGH) {
    pianoKeyVal = "D";
    delay(100);
  } else if (stateDd == HIGH) {
    pianoKeyVal = "Dd";
    delay(100);
  } else if (stateE == HIGH) {
    pianoKeyVal = "E";
    delay(100);
  } else if (stateF == HIGH) {
    pianoKeyVal = "F";
    delay(100);
  } else if (stateFd == HIGH) {
    pianoKeyVal = "Fd";
    delay(100);
  } else if (stateG == HIGH) {
    pianoKeyVal = "G";
    delay(100);
  } else if (stateGd == HIGH) {
    pianoKeyVal = "Gd";
    delay(100);
  } else if (stateA == HIGH) {
    pianoKeyVal = "A";
    delay(100);
  } else if (stateBb == HIGH) {
    pianoKeyVal = "Bb";
    delay(100);
  } else if (stateB == HIGH) {
    pianoKeyVal = "B";
    delay(100);
  } else if (stateC2 == HIGH) {
    pianoKeyVal = "C2";
    delay(100);
  } else {
    pressed = false;
    pianoKeyVal = "none";
    delay(100);
  }
  
  if (pianoKeyVal == "C" && pianoKeyVal != lastPianoKeyVal) {
    valS = 1;
    Serial.write(valS);
//    Serial.println(valS);
//    Serial.println("Last Key: " + lastPianoKeyVal);
//    Serial.println( "Current Key: " + pianoKeyVal);
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
