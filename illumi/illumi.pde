PImage img;

void setup() {
  size(700,400);
  img = loadImage("1.jpg");
  background(0);
  smooth();
}

void draw() {
  image(img, width/4, height/4, width/2, height/2);
  float r = random(255);
  float g = random(255);
  float b = random(255);
  float a = random(255);
  float x = random(width);
  float y = random(height);
  float diameter = random(20);

  noStroke();
  fill(r,g,b,a);
  ellipse(x,y,diameter,diameter);
}
