Goose goose;

void setup(){
  size(640, 640);
  goose = new Goose(50, 50, 100, 100);
}

void draw(){
  goose.display();
  goose.move();
}