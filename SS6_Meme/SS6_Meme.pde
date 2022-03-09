//Meme by Alyona Radkevich

PImage f1, f2, f3;
PImage s1, s2, s3;
PImage bg;

int n;
int t;
int delay = 1000;

float frames = 0;

boolean start = false;

PFont font;

void setup() {
  size(800, 440);
  textSize(62);
  textAlign(CENTER);
  font = createFont("Georgia", 32);
  
  bg = loadImage("bg.PNG");
  f1 = loadImage("f1.PNG");
  f2 = loadImage("f2.PNG");
  f3 = loadImage("f3.PNG");
  s1 = loadImage("s1.PNG");
  s2 = loadImage("s2.PNG");
  s3 = loadImage("s3.PNG");

}

void draw() {
  PImage f[] = {f1, f2, f3, f2};
  PImage s[] = {s1, s2, s3};
  t = millis();
  
  if (!start) {
    begin();
    if (t < delay*2) {
      n = 3;
    } else if (t < delay*3) {
      n = 2;
    } else if (t < delay*4) {
      n = 1;
    }
     background(255);
    fill(0);
    text(n, width/2, height/2);
    
  } else if (start) {
    background(bg);
    animate(s);
    animate(f);
  }
}

void animate(PImage arr[]) {
  if (mousePressed) {
   frames = 0;
  } else {
    frames += 0.10;
  }
  image(arr[(int)Math.floor(frames) % arr.length], 0, 0);
}

void begin() {
  if (t > delay*4) {
  start = true;
  }
}
