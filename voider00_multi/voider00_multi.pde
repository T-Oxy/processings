import processing.video.*;

Capture cam;
int camWidth = 640;
int camHeight = 480;

void setup() {
  //size(camWidth * 2, camHeight);
  surface.setResizable(true);
  surface.setSize(camWidth * 2, camHeight);
  
  String[] cameras = Capture.list();
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    cam = new Capture(this, cameras[0]);
    cam.start();
  }
}

void captureEvent(Capture c) {
  c.read();
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  
  image(cam, 0, 0, camWidth, camHeight);
  image(cam, camWidth, 0, camWidth, camHeight);
}
