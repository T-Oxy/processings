import gab.opencv.*;
import java.awt.Rectangle;
import processing.video.*;

Capture video;
OpenCV opencv;
Rectangle[] faces;

void setup() {
  size(800, 600);
  background(0);
  video =new Capture(this, width/2, height/2);
  opencv=new OpenCV(this, width/2, height/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  video.start();
}

void draw() {
  scale(2);
  opencv.loadImage(video);
  pushMatrix();
  scale(-1, 1);
  image(video, -width/2, 0);
  popMatrix();

  Rectangle[] faces =opencv.detect();
  opencv.loadImage(video);
  strokeWeight(3);
  stroke(255, 255);
  fill(255,0,0, 127);
  strokeWeight(3);

  for ( int i = 0; i <faces.length; i ++) {
    pushMatrix();
    scale(-1, 1);
    translate(-width/2, 0);
    noFill();
    rect(faces[i].x - faces[i].width*0.1, faces[i].y - faces[i].height*0.4, faces[i].width*1.2, faces[i].height*1.5);
    popMatrix();
  }
}



void captureEvent(Capture c) {
  c.read();
}
