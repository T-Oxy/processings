void setup() {
  size(841, 1189); // A3サイズ
  PFont font = createFont("Meiryo", 10);
  textFont(font);
}

void draw() {
  background(255); // 白色の背景
  fill(255, 204, 0); // 黄色
  rect(0, 0, 841, 300); // 上部の黄色の部分
  
  fill(0, 102, 204); // 青色
  rect(0, 300, 841, 600); // 中央の青色の部分
  
  fill(0); // 黒色
  textSize(80); // タイトルのフォントサイズ
  textAlign(CENTER);
  text("ChatGPT 学生ライフハック", 420, 200); // タイトル
  
  textSize(40); // テキストのフォントサイズ
  textAlign(LEFT);
  String textContent = "ChatGPTの登場によって、レポート作成や書類作成、疑問の回答など、\n様々なことが簡単にできるようになりました。このような新しい技術が登場したことで、\nより効率的な学生生活を送ることができるはずです。様々な分野で活躍している方々が\nChatGPTを活用している中、我々学生はどのように使うと効率が良いのか、また他の学生\nや先生方はどのように活用しているのかを共有する場を提供することが本イベントの目的です。";
  text(textContent, 50, 350, 740, 500); // テキストの表示位置とサイズ
}
