/*void setup() {
  size(200, 200);
}

void draw() {
  fill(random(256));
  textSize(random(12, 36));
  textAlign(CENTER);
  text(int(random(10)), random(width), random(height));
}*/

void setup() {
  size(640, 360);
  background(255);
}

void draw() {
}

void keyPressed() {
  fill(random(256), random(102, 256));
  textSize(random(36, 64));
  textAlign(CENTER);
  text(key, random(width), random(height));
}
