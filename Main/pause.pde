class Pause{
  boolean stato = true;
  int x = 5;
  int y = 5;
  int h = 50;
  int b = 50;
  Goose supportGoose;

  Pause(Goose goose){
    this.supportGoose = goose;
  }

  void draw(){
    fill(255, 165, 0);
    rect (x, y, h, b);
    fill(255);
    rect(x+15, y*3, b-42.5, h-y*4);
    rect(x+15+(b-37.5), y*3, b-42.5, h-y*4); 
  }

  void mouseClicked(){
    stato = !stato;
    supportGoose.sistemGravity(stato);
  }

  void resume(){
    stato = true;
    supportGoose.sistemGravity(stato);
  }

  boolean isPaused(){
    return !stato;
  }

  boolean isClicked(int mouseX, int mouseY){
    return mouseX >= x && mouseX <= x + h && mouseY >= y && mouseY <= y + b;
  }
}