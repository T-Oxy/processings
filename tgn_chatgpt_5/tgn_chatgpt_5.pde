PFont font;

void setup() {
  size(420, 594);
  font = createFont("Meiryo", 32);
}

void draw() {
  background(240, 240, 240);
  stroke(0);
  fill(0);
  textFont(font);
  textAlign(CENTER, CENTER);

  // タイトルの描画
  textSize(28);
  text("『ChatGPT 学生ライフハック』", width/2, height/4);

  // イベント情報の描画
  textSize(17);
  String[] eventInfo = {
    "つくば院生ネットワーク(TGN)主催",
    "開催時期：2023年5月下旬予定",
    "ChatGPTの賢い使い方を一緒に学びましょう！",
    " ",
    "参加申し込みはこちらから"
  };
  float lineHeight = textAscent() + textDescent() + 10;
  float startY = height/2 - ((eventInfo.length-1)*lineHeight)/2;
  for (int i = 0; i < eventInfo.length; i++) {
    text(eventInfo[i], width/2, startY + i*lineHeight);
  }

  // 背景の描画
  noStroke();
  fill(255, 120, 120, 50);
  ellipse(width*3/4, height*3/4, 200, 200);
  fill(120, 255, 120, 50);
  ellipse(width/4, height/4, 200, 200);
  fill(120, 120, 255, 50);
  ellipse(width/2, height/2, 300, 300);
}
