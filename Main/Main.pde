Goose goose;

void setup(){
  size(640, 640);
  
  goose = new Goose();
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