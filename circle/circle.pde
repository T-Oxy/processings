int HEIGHT = 29;
int WIDTH = 47;
int SIZE = 10;
int map[][] = new int[WIDTH][HEIGHT];
int time = 0;
int status = 0;
boolean isDrawable = false;
void setup() {
  size(470, 290);
  // circle
  map[11][10] = 1;
  map[12][10] = 1;
  map[13][10] = 1;
  map[14][10] = 1;
  map[15][10] = 1;
  map[10][11] = 1;
  map[16][11] = 1;
  map[9][12] = 1;
  map[9][13] = 1;
  map[9][14] = 1;
  map[9][15] = 1;
  map[9][16] = 1;
  map[17][12] = 1;
  map[17][13] = 1;
  map[17][14] = 1;
  map[17][15] = 1;
  map[17][16] = 1;
  map[10][17] = 1;
  map[16][17] = 1;
  map[11][18] = 1;
  map[12][18] = 1;
  map[13][18] = 1;
  map[14][18] = 1;
  map[15][18] = 1;

  //cross
  /*
  map[31][12] = 1;
  map[32][13] = 1;
  map[33][14] = 1;
  map[34][15] = 1;
  map[35][16] = 1;
  map[35][12] = 1;
  map[34][13] = 1;
  map[32][15] = 1;
  map[31][16] = 1;
 */
}

void draw() {
  background(255);
  if(isDrawable){
    if(mousePressed){
      int x = mouseX / SIZE;
      int y = mouseY / SIZE;
      if(x >= 0 && x < WIDTH && y >= 0 && y < HEIGHT){
        int value = 1;
        if(mouseButton == RIGHT){
          value = 0;
        }
        map[x][y] = value;
      }
    }
  }
  if(status == 1){
    time += 1;
    if(time > 10){
      step();
      time = 0;
    }
  }
  drawGridLines();
  for (int y=0; y<HEIGHT; y++) {
    for (int x=0; x<WIDTH; x++) {
      if (isAlive(x, y)) {
        drawLife(x, y);
      }
    }
  }
}

void keyPressed(){
  if(status == 0){
    status = 1; 
  }else if(status == 1){
    status = 0;
  }
}
void mousePressed(){
      int x = mouseX / SIZE;
      int y = mouseY / SIZE;
      if(x >= 0 && x < WIDTH && y >= 0 && y < HEIGHT){
        int value = 1;
        if(mouseButton == RIGHT){
          value = 0;
        }
        clickGrid(x, y);
      }
}

void step(){
  int[][] _map = new int[WIDTH][HEIGHT];
  for (int y=0; y<HEIGHT; y++) {
    for (int x=0; x<WIDTH; x++) {
      _map[x][y] = map[x][y];
    }
  }

  for (int y=0; y<HEIGHT; y++) {
    for (int x=0; x<WIDTH; x++) {

      int count = getCountLife(x, y);
      if(isAlive(x, y)){
        if(count < 2){
           _map[x][y] = 0;
        }
        if(count > 3){
          _map[x][y] = 0;
        }
      }else{
        if(count == 3){
          _map[x][y] = 1;
        }
      }
    }
  }
  for (int y=0; y<HEIGHT; y++) {
    for (int x=0; x<WIDTH; x++) {
      map[x][y] = _map[x][y];
    }
  }
}
int getCountLife(int x, int y) {
  int count = 0;
  for (int _y=-1; _y<=1; _y++) {
    for (int _x = -1; _x<=1; _x++) {
      if (_x == 0 && _y == 0) {
        continue;
      }
      if (isAlive(x + _x, y + _y)) {
        count += 1;
      }
    }
  }
  return count;
}
boolean isAlive(int x, int y) {
  if (x >= WIDTH || x < 0 || y >= HEIGHT || y < 0) {
    return false;
  }
  if (map[x][y] == 1) {
    return true;
  }
  return false;
}
void drawLife(int x, int y) {
  fill(0);
  rect(x * SIZE, y * SIZE, SIZE, SIZE);
}
void drawGridLines() {
  stroke(0, 20);
  for (int x = 0; x<width; x+=SIZE) {
    line(x, 0, x, width);
  }
  for (int y=0; y<height; y+= SIZE) {
    line(0, y, width, y);
  }
}
void clickGrid(int yoko, int tate){
  // Prgraming Start!
}
