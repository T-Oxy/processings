import processing.video.*;
Capture camera;
char flag = '6'; 

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
    } else if (flag == '1'){  //円モザイク2、点滅
        for(int y = d / 2 ; y < height ; y += d) {
            for(int x = d / 2 ; x < width ; x += d) {
                fill(camera.pixels[y * width + x]);
                float d1 = random(10, 25);
                ellipse(x, y, d1, d1);
            }
        }    
    } else if(flag == '2'){
        for(int y = d / 2 ; y < height ; y += d) {
            for(int x = d / 2 ; x < width ; x += d) {
                fill(camera.pixels[y * width + x]);
                if(random(1)>0.9){
                    fill(245,130,32,30);
                }
                ellipse(x, y, d, d);
            }
        }
    } else if(flag=='3'){  //全橙
        background(245,130,32);
    } else if(flag=='4'){  // モザイク
      for(int j = 0; j < height; j+=d) {  
        for(int i = 0; i < width; i+=d) {  
          color c = camera.pixels[j * width + i];
          fill(c);
          rect(i, j, d, d);
        }
     }
  }  else if(flag=='5'){  // モザイク2、点滅
          for(int y = 0 ; y < height ; y += d) {
            for(int x = 0; x < width ; x += d) {
                fill(camera.pixels[y * width + x]);
                float d1 = random(10, 20);
                rect(x, y, d1, d1);
            }
        }    
      } else if(flag == '6'){
        for(int y = 0 ; y < height ; y += d) {
            for(int x = 0 ; x < width ; x += d) {
                fill(camera.pixels[y * width + x]);
                if(random(1)>0.7){
                    fill(245,130,32,30);
                }
                rect(x, y, d, d);
            }
        }
      }
}



void captureEvent(Capture camera) {
    camera.read();
}

void keyPressed() {
    if (key == TAB) {          // Tabキーに反応
        exit();
    } else { //数字のキーなら変身、それ以外なら暗転
        flag = key;
    } 
}
