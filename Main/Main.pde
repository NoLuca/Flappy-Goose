Goose goose;

void setup(){
  size(640, 640);
  
  goose = new Goose(320, 320, 100, 100);
}

void draw(){
  goose.draw();
  goose.sistemGravity();
 
}

 void keyPressed() {
    if (key == ' ') { 
        goose.flap();
    }
}