Goose goose;

void setup(){
  size(640, 640);
  
  goose = new Goose();
}

void draw(){
  goose.draw();
  clear();
  goose.sistemGravity();
 
}

 void keyPressed() {
    if (key == ' ') { 
        goose.flap();
    }
}