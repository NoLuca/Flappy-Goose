  public class Goose{
  int X;
  int Y;
  int l, h;
  public Goose(int X, int Y, int l, int h){
      this.X = X; 
      this.Y = Y;
      this.l = l;
      this.h = h; 
  }
  void display(){
    ellipseMode(CENTER);
    ellipse(X, Y, l, h);
  }
  
  void move(){
    this.X++;
  }
}
