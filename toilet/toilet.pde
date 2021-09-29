PImage img;
int mosaicWidth = 30;
int mosaicHeight = 20;
 
void setup() {
  size(900, 600);
  noStroke();
  img = loadImage("toiletman.jpg");
}
 
void draw() {
  background(0);
  image(img, 0, 0);
  loadPixels();
 
  for(int j = 0; j < height; j+=mosaicHeight) {  
    for(int i = 0; i < width; i+=mosaicWidth) {  
      color c = pixels[j * width + i];
      fill(c);
      rect(i, j, mosaicWidth, mosaicHeight);
    }
  }
}
 
void mouseDragged() {
  mosaicWidth = mouseX / 4 + 10;
  mosaicHeight = mouseY / 4 + 10;
}
