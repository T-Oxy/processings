import processing.video.*;
Capture camera;
PImage img;
char flag = '0'; 

void setup() {
    size(800,600);
//  size(1280,720);
//    size(1000,750);
    camera = new Capture(this, width, height, 12);
    camera.start();
    smooth();
    noStroke();
}

void draw() {
    background(0);
    camera.loadPixels(); //カメラ画像のpixel情報を読み込み
//    int d =15;
  int d=20;
    if(flag == '0'){  // 円モザイク  
        for(int y = d / 2 ; y < height ; y += d) {
            for(int x = d / 2 ; x < width ; x += d) {
                fill(camera.pixels[y * width + x]);
                ellipse(x, y, d, d);
                //text("A", x,y);
            }
        }
    } else if (flag == '1'){  //円モザイク2
        for(int y = d / 2 ; y < height ; y += d) {
            for(int x = d / 2 ; x < width ; x += d) {
                fill(camera.pixels[y * width + x]);
                float d1 = random(10, 20);
                ellipse(x, y, d1, d1);
            }
        }    
    } else if(flag == '3'){  //四角モザイク
        for(int j = 0; j < height; j+=d) {  
            for(int i = 0; i < width; i+=d) {  
                color c = camera.pixels[j * width + i];
                fill(c);
                rect(i, j, d, d);
            }
        }
    } else if (flag=='4'){  //黒背景の中点滅
        int x = int(random(width));
        int y = int(random(height));
        //その点の色情報を取得し、塗り色に設定
        fill(camera.pixels[y*width + x]);
        //その点の位置を中心として直径10から20pxの円を描く
        float d4 = random(10, 20);
        ellipse(x, y, d4, d4);
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
