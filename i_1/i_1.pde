void setup() {    
    size(400, 400);    
    frameRate(60);
}

void draw() {    
    background(255);    
    translate(width/2, height/2);    
    rotate(radians(frameCount));    
    rect(0, 0, 60, 60);
    ellipse(20,20,10,10);

}
