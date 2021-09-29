int MARGIN = 20;
 
void setup() {
  size(500,500);
  stroke(255);
  smooth();
  frameRate(50);
}
 
void draw() {
  background(0);
 
  float s = second();
  float m = minute() + (s/60.0);
  float h = hour()%12 + (m/60.0);
  translate(width/2, height/2);
  rotate(radians(180));

  // 文字盤
  pushMatrix();
  fill(128);
  noStroke();
  for(int i=0; i<60; i++){
    rotate(radians(6));
    ellipse(width/4-MARGIN,0,3,3);
  }
  for(int i=0; i<12; i++){
    rotate(radians(30));
    ellipse(width/4-MARGIN,0,10,10);
  }
  popMatrix();
  noFill();
  stroke(255);
 
  // 実際の秒針
/*  pushMatrix();
  rotate(radians(s*(360/60)));
  strokeWeight(1);
  line(0,0,0,width/2-MARGIN);
  popMatrix();
 
  // 実際の分針
  pushMatrix();
  rotate(radians(m*(360/60)));
  strokeWeight(2);
  line(0,0,0,width/2-MARGIN);
  popMatrix();*/
 
  // 時針
  pushMatrix();
  rotate(radians(h*(360/12)));
  strokeWeight(4);
  line(0,0,0,width/6-MARGIN);
  // 分針
  translate(0,width/6-MARGIN);
  rotate(radians(-h*(360/12)));
  rotate(radians(m*(360/60)));
  strokeWeight(2);
  line(0,0,0,width/4-MARGIN);
  //秒針
  translate(0,width/4-MARGIN); 
  rotate(radians(-m*(360/60)));
  rotate(radians(s*(360/60)));
  strokeWeight(1);
  line(0,0,0,width/4-MARGIN);
  popMatrix();
}
