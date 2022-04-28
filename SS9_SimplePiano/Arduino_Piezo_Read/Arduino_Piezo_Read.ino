const int piezo = 2;
int val;
int pitch = 0;

const float C = 261.63;
const float Cd = 277.18;
const float D = 293.66;
const float Dd = 311.13;
const float E = 329.63;
const float F = 349.23;
const float Fd = 369.99;
const float G = 392;
const float Gd = 415.30;
const float A = 440;
const float Bb = 466.16;
const float B = 493.88;
const float C2 = 523.25;

void setup() {
  pinMode(piezo, OUTPUT); 
  Serial.begin (9600);
}

void loop() {
  if (Serial.available()) {
    val = Serial.read();
    delay (1);
  }

  if (val == 1) {
    pitch = C;
  } else if (val == 2) {
    pitch = Cd;
  } else if (val == 3) {
    pitch = D;
  } else if (val == 4) {
    pitch = Dd;
  } else if (val == 5) {
    pitch = E;
  } else if (val == 6) {
    pitch = F;
  } else if (val == 7) {
    pitch = Fd;
  } else if (val == 8) {
    pitch = G;
  } else if (val == 9) {
    pitch = Gd;
  } else if (val == 10) {
    pitch = A;
  } else if (val == 11) {
    pitch = Bb;
  } else if (val == 12) {
    pitch = B;
  } else if (val == 13) {
    pitch = C2;
  } else if (val == 0) {
    pitch = 0;
  }
  

  tone (piezo, pitch, 100); 
  delay (100);   
}
