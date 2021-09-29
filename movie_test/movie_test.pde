import processing.video.*;
Capture camera;

void setup() {
  size(480,320);
  camera = new Capture(this, width, height, 12);
  camera.start();
  smooth();
  noStroke();
}

void draw() {
  background(0);
  camera.loadPixels(); //カメラ画像のpixel情報を読み込み
  int d = 10; //円の直径を定義
  // ライブカメラの映像から、円の直径の間隔ごとに、色情報を取得し、その色で円を描く
  for(int y = d / 2 ; y < height ; y += d) {
    for(int x = d / 2 ; x < width ; x += d) {
      fill(camera.pixels[y * width + x]);
      ellipse(x, y, d, d);
    }
  }
} 

void captureEvent(Capture camera) {
  camera.read();
}
