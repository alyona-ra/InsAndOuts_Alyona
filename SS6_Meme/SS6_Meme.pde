//Meme by Alyona Radkevich

PImage f1, f2, f3;
PImage s1, s2, s3;
PImage bg;

float frames = 0;

void setup() {
  size(800, 440);
  
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
  
  background(bg);
  animate(s);
  animate(f);
}

void animate(PImage arr[]) {
  frames += 0.10;
  image(arr[(int)Math.floor(frames) % arr.length], 0, 0);
}
