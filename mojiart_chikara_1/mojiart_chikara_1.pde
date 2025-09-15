void setup() {
 size(500, 500);
 PFont font = createFont("Meiryo", 50);
 textFont(font);
}

int x=50;
int y;

void draw() {
 background(255);
 fill(0);
 textSize(x);
 text("力", (width-x)/2, height/2+2*x);
 x += 1;
 y = x;
 while(y >= 100){
  y -= 50;
  text("チカラ", (width-3*y)/2, height/2+y+50);   
 }   
}
