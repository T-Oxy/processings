void setup() {
  PFont myFont = createFont("Meiryo", 50); // PFont型の変数を宣言
  size(480, 480);   // ウィンドウのサイズを600x600に設定
  background(255);  // 背景色を白に設定
  textAlign(CENTER, CENTER);  // テキストの配置を中央に設定
  textFont(myFont);  // ロードしたフォントを適用
}

void draw() {
  // 1フレームごとに背景を白で塗りつぶす（新しい文字を描画することで文字が重なって描画され続けるのを防ぐため）
  background(255);
  
  // 50個の文字を描画
  for (int i = 0; i < 50; i++) {
    //位置
    float x = random(width);
    float y = random(height);
    
    //サイズ
    float fontSize = random(10, 100);  
    textSize(fontSize);
    
    //
    
    fill(0);
    text("う", x, y);
  }
}
