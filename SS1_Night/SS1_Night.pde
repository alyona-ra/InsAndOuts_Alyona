//Night by Alyona Radkevich
size(1080, 720);

int height = 720;
int width = 1080;

background(50, 64, 103);
noStroke();

//moon
fill(234, 234, 211, 60);
circle(500, 500, 300);
fill(229, 229, 188, 150);
circle(500, 500, 250);
fill(229, 229, 171);
circle(500, 500, 200);

//fields
fill(100, 93, 162);
ellipse(100, height, 1000, 500);
fill(57, 52, 124);
ellipse(width, height, 1400, 600);

//trees (top)
stroke(24, 31, 23);
strokeWeight(2);
fill(72, 111, 65);
triangle(100, 600, 150, 400, 200, 600);

strokeWeight(3);
fill(50, 90, 40);
triangle(950, 450, 970, 350, 990, 450);

strokeWeight(4);
fill(76, 157, 59);
triangle(700, 500, 740, 300, 780, 500);

//trees (bottom)
strokeWeight(2);
stroke(33, 27, 15);
fill(70, 55, 25);
rect(140, 600, 20, 50);
rect(965, 450, 10, 30);
rect(730, 500, 20, 50);

//stars
stroke(255);
strokeWeight(5);
point(75, 100);
point(275, 120);
point(55, 350);
point(975, 40);
point(540, 250);
point(900, 300);
point(400, 70);
