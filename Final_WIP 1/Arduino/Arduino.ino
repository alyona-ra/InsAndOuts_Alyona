int LED13 = 13;
int button = 2;
int state = 0;

boolean pressed;

String pianoKeyVal;
String lastPianoKeyVal;
int valR;
byte valS;

void setup() {
  // put your setup code here, to run once:
  pinMode(LED13, OUTPUT);
  pinMode(button, INPUT);
  Serial.begin(9600);
}

void loop() {

  if (Serial.available()) {
    valR = Serial.read();
    delay (1);
  }
  
  // put your main code here, to run repeatedly:
  state = digitalRead(button);
  pressed = false;

  if (!pressed) {
    pianoKeyVal = "none";
  }
  
  if (state == HIGH) {
    pressed = true;
    digitalWrite(LED13, HIGH);
    pianoKeyVal = "C";
    delay(100);
//    lastPianoKeyVal = pianoKeyVal;
//    Serial.write(1);
//    Serial.println(1);
  } else {
    pressed = false;
    digitalWrite(LED13, LOW);
    pianoKeyVal = "none";
    delay(100);

//    if (lastPianoKeyVal != 0) {
//      Serial.write(20);
//    }
////    pianoKeyVal = 0;
//    lastPianoKeyVal = pianoKeyVal;
  }
  
  if (pianoKeyVal == "C" && pianoKeyVal != lastPianoKeyVal) {
    valS = 1;
    Serial.write(valS);
//    Serial.println(valS);
//    Serial.println("Last Key: " + lastPianoKeyVal);
//    Serial.println( "Current Key: " + pianoKeyVal);
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
