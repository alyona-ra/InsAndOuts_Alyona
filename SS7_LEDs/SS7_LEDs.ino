const int button = 2;
int buttonState = 0;
int LEDs[] = {13, 12, 11, 10, 9, 8, 7, 6}; 

void setup() {
  for (int i = 0; i < 8; i++) {
      pinMode(LEDs[i], OUTPUT);
  }
}

void loop() {
  buttonState = digitalRead(button);
  delay(10);
  if(buttonState == HIGH){
    for (int i = 0; i < 8; i+=2) {
        digitalWrite(LEDs[i], HIGH);
        delay(100);
        digitalWrite(LEDs[i], LOW);
    }
    for (int i = 1; i < 8; i+=2) {
        digitalWrite(LEDs[i], HIGH);
        delay(100);
        digitalWrite(LEDs[i], LOW);
    }
    for (int i = 6; i > 0; i-=2) {
        digitalWrite(LEDs[i], HIGH);
        delay(100);
        digitalWrite(LEDs[i], LOW);
    }
    for (int i = 7; i > 0; i-=2) {
        digitalWrite(LEDs[i], HIGH);
        delay(100);
        digitalWrite(LEDs[i], LOW);
    }
      
  } else {
    for (int i = 0; i < 8; i++) {
        digitalWrite(LEDs[i], LOW);
    }
  }
}
