import processing.video.*;
Capture camera;
char flag = '0'; 

void setup() {
    size(900,600);
//  size(1280,720);
    camera = new Capture(this, width, height, "pipeline:autovideosrc");
//    camera = new Capture(this, width, height, 12);
    camera.start();
    smooth();
    noStroke();
}

void draw() {
    background(0);
    //background(245,130,32);  //orange
    //background(255, 0, 0);  //red
   // background(0, 255, 0);  //green
    //background(0, 0, 255);  //blue
    //background(255, 255, 0);  //yellow
    
    camera.loadPixels(); //カメラ画像のpixel情報を読み込み
    int d = 20;
    if(flag == '0'){  // 円  
        for(int y = d / 2 ; y < height ; y += d) {
            for(int x = d / 2 ; x < width ; x += d) {
                fill(camera.pixels[y * width + x]);                
                ellipse(x, y, d, d);
            }
        }
    } else if(flag=='1'){
      background(255, 0, 0);  //red
    } else if(flag=='2'){ 
      background(0, 255, 0);  //green
    } else if(flag=='3'){
      background(0, 0, 255);  //blue
    }
  }    



void captureEvent(Capture camera) {
    camera.read();
}

void keyPressed() {
    if (key == TAB) {
        exit();
    } else {
        flag = key;
    } 
}
