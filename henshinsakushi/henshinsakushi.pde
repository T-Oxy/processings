float Pangle = radians(-20);
float Qangle = radians(20);
float pointCount = 80;
float figSize = 300;
float lineWidth = 1;
float pointSize = 8;
float aspect = 0.4;

ArrayList<PVector> ps = new ArrayList<PVector>();
ArrayList<PVector> qs = new ArrayList<PVector>();

void setup(){
  fullScreen(P3D);
  ortho();
  for (int i = 0; i <= pointCount; i++){
    PVector p = new PVector(cos(i/pointCount*TWO_PI)*figSize, sin(i/pointCount*TWO_PI)*figSize*aspect+figSize);
    float inv = -1;
    if(1 == (int)((i/pointCount*2)%2)){
      inv = 1;
    }
    PVector q = new PVector(cos(i/pointCount*TWO_PI)*figSize, inv*((1-abs(cos(i/pointCount*TWO_PI)))*figSize)*aspect-figSize);
    ps.add(p);
    qs.add(q);
  }
}

void draw(){
  background(0);
  translate(width/2, height/2);
  rotateX(-(float)(mouseY-height/2)/500);
  rotateY((float)(mouseX-width/2)/500);
  stroke(255);
  
  for(int i = 0; i <= pointCount; i++){
    PVector p = ps.get(i);
    PVector q = qs.get(i);
    pointVec(p);
    pointVec(q);
    //showRay(p, Pangle, 1000, true);
    pointVec(intersection(p, q, Pangle, Qangle, false));
  }
  
  PVector p = new PVector(0,figSize);
  PVector q = new PVector(0,-figSize);
  PVector result = intersection(p, q, Pangle, Qangle, true);
  
  
  strokeWeight(lineWidth);
  stroke(255,0,0);
  line(-10000, 0,0,10000,0,0);
  stroke(0,255,0);
  line(0,-10000,0,0,10000,0);
  stroke(0,0,255);
  line(0,0,-10000,0,0,10000);
}

void showRay(PVector pos, float angle, float len, boolean enablePoint){
  float dz = cos(angle)*len;
  float dy = sin(angle)*len;
  strokeWeight(lineWidth);
  line(pos.x, pos.y-dy, pos.z-dz, pos.x, pos.y+dy, pos.z+dz);
  if(enablePoint){
    pointVec(pos);
  }
}

PVector intersection(PVector a, PVector b, float angleA, float angleB, boolean debug){
  PVector ta = new PVector(a.z, a.y);
  PVector tb = new PVector(b.z, b.y);
  PVector da = new PVector(cos(angleA)*10000, sin(angleA)*10000);
  PVector db = new PVector(cos(angleB)*10000, sin(angleB)*10000);
  PVector tResult = intersection(PVector.sub(ta, da), PVector.add(ta, da), PVector.sub(tb, db), PVector.add(tb, db));
  PVector result = new PVector(a.x, tResult.y, tResult.x);
  if(debug){
    showRay(a, angleA, 1000 , true);
    showRay(b, angleB, 1000 , true);
    pointVec(result);
  }
  return result;
}

void pointVec(PVector pos){
  strokeWeight(pointSize);
  point(pos.x, pos.y, pos.z);
}

PVector intersection(PVector s1, PVector e1, PVector s2, PVector e2){
  s1 = new PVector(s1.x, s1.y);
  e1 = new PVector(e1.x, e1.y);
  s2 = new PVector(s2.x, s2.y);
  e2 = new PVector(e2.x, e2.y);
  float d1 = lineDist(s1, s2, e2);
  float d2 = lineDist(e1, s2, e2);
  float t = d1 / (d1 + d2);
  PVector dl1 = PVector.sub(e1,s1);
  return s1.add(dl1.mult(t));
}

float lineDist(PVector c, PVector a, PVector b) {
  PVector norm = scalarProjection(c, a, b);
  return PVector.dist(c, norm);
}

PVector scalarProjection(PVector p, PVector a, PVector b) {
  PVector ap = PVector.sub(p, a);
  PVector ab = PVector.sub(b, a);
  ab.normalize(); // Normalize the line
  ab.mult(ap.dot(ab));
  PVector normalPoint = PVector.add(a, ab);
  return normalPoint;
}
