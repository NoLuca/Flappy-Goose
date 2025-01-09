  public class Goose{
  int X;
  int Y;
  int l, h;
  float velocityY = 0; 
  float gravity = 0.1f;
  boolean falling = true; 
  
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
  
   
    void gravity() {
        if (falling) {
           
            velocityY += gravity; 
            this.Y += velocityY;

            
            if (this.Y > 640-50) { 
                this.Y = 640-50;
                velocityY = 0; 
                falling = false; 
            }
        }
    }

}
