import processing.video.*;
Capture camera;

int a=1;

void setup() {
  size(900,600);
  camera = new Capture(this, width, height, 12);
  camera.start();
  smooth();
  noStroke();
}

void draw() {
  background(0);
  camera.loadPixels(); //カメラ画像のpixel情報を読み込み
  int d = 20; //円の直径を定義
  // ライブカメラの映像から、円の直径の間隔ごとに、色情報を取得し、その色で円を描く
  for(int y = d / 2 ; y < height ; y += d) {
    for(int x = d / 2 ; x < width ; x += d) {
      fill(camera.pixels[y * width + x]);
     ellipse(x, y, d, d);
      text("A", x,y);

/*  for(int j = 0; j < height; j+=d) {  
    for(int i = 0; i < width; i+=d) {  
      color c = camera.pixels[j * width + i];
      fill(c);
      rect(i, j, d, d);*/
    }
  }
} 

void captureEvent(Capture camera) {
  camera.read();
}

void keyPressed(){
  //エンターキーが押されたら
  if(keyCode == ENTER){
    //「sample 番号 .png」の名前で画像を保存
    save("sample" + a + ".png");
    //この処理を行うごとにaを1増やす
    a++;
  }
}
