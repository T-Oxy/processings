import processing.video.*;
Capture camera;

void setup() {
  size(900,600);
//  size(1280,720);
  camera = new Capture(this, width, height, 12);
  camera.start();
  smooth();
  noStroke();
}

void draw() {
  background(0);
  camera.loadPixels(); //カメラ画像のpixel情報を読み込み
  int d = 15; 
  for(int j = 0; j < height; j+=d) {  
    for(int i = 0; i < width; i+=d) {  
      color c = camera.pixels[j * width + i];
      fill(c);
      rect(i, j, d, d);
    }
  }
} 

void captureEvent(Capture camera) {
  camera.read();
}

void keyPressed() {
    if (key == '3') {          // Tabキーに反応
        exit();
    }
}
