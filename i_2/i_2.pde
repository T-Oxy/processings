int t0, t1;
int N = 12;
float vel = 6.0; 

void setup() {
  size(800, 800);
  t0 = millis();
}

void draw() {
  background(128);
  noStroke();
  t1 = millis() - t0; 
  int j = int(t1/1000.0*vel) % N;
  fill(221, 157, 221);
  for (int i=0; i<N; ++i) {
    if (j == i) continue;
    ellipse(400+(cos(float(i)/N*2*PI))*300, 400+(sin(float(i)/N*2*PI))*300, 50, 50);
  }
  // filter(BLUR, 2);
  fill(255);
  ellipse(400, 400, 20, 20);
} 
