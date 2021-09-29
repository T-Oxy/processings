float angle = 0;

void setup() {
  size(600, 600);
  background(255);
}

void draw() {
  translate(mouseX, mouseY);
  rotate(angle);
  rect(0, 0, 50, 50);
  angle += 0.1;
}
