import processing.video.*;
Capture camera;

int a=1;
int b=1;

void setup() {
  size(900,600);
  camera = new Capture(this, width, height, "pipeline:autovideosrc");
 // camera = new Capture(this, width, height, 12);
  camera.start();
  smooth();
  noStroke();
}

void draw() {
  image(camera, 0, 0); // 画面に表示
} 

void captureEvent(Capture camera) {
  camera.read();
}

void keyPressed(){
//  fill(random(256), random(242, 256));
//  textSize(random(36, 64));
//  textAlign(CENTER);
//  text(key, random(width), random(height));
  //草生やした時の顔
  if ((keyPressed == true) && (key == 'w')) {
    save("laugh_" + a + ".png");
    a++;
  }
}
