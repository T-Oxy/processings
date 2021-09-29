final int floNum = 50;
Flowers[] flowers = new Flowers[floNum];

int cnt;
void setup() {
  size(800, 600);
  smooth();
  noStroke();
  background(255);
  frameRate(30);
  for (int i=0; i<floNum; i++) {
    flowers[i] = new Flowers();
  }
}

void draw() {
  
  fill(255,200);
  rect(0,0,width, height);

  for (int i=0; i<floNum; i++) {
    flowers[i].rotateRect(cnt);
  }
  cnt++;
}

class Flowers {

  float sizeX;
  float sizeY;
  float posX;
  float posY;
  float centerX;
  float centerY;
  float speed;
  int startCnt;
  color colorFlower;
  float rotateCenter;

  Flowers() {
    posX = random(width);
    posY = random(height);
    sizeX = random(90)+10;
    sizeY = random(90)+10;
    centerX = posX + sizeX/2;
    centerY = posY + sizeY/2;
    speed = random(15)+ 10;
    colorFlower = color(random(150)+100, random(150)+100, random(150)+100, 220);
    startCnt = int(random(250));
    //rotateCenter = random(200) + 100;
    rotateCenter =0;
  }

  void rotateRect(int cnt) {
    if (cnt > startCnt) {
      fill(colorFlower);
      pushMatrix();
      translate(centerX, centerY);
      rotate((cnt-startCnt)*radians(speed));
      translate(-centerX - rotateCenter, -centerY - rotateCenter);
      rect(posX, posY, sizeX, sizeY);
      //rect(random(width), random(height), sizeX, sizeY);
      popMatrix();
    }
  }
}
