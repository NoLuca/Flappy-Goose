class Goose {
  float x = 320;
  float y = 320;
  float velocity = 0;
  float gravity = 0.6;
  float flapStrength = -10;
  int dimensionOfGoose = 5;
  final int COSTANT_BODY_GOOSE = 3;

  
  void sistemGravity() {
    velocity += gravity;
    y += velocity;
  }

  void draw() {
    
  background(0); 
  noStroke();
  fill(255);
  rect(x, y, dimensionOfGoose*9, dimensionOfGoose*COSTANT_BODY_GOOSE);     
  rect(x + 31, y - dimensionOfGoose*COSTANT_BODY_GOOSE, dimensionOfGoose*5, dimensionOfGoose*COSTANT_BODY_GOOSE);  
  rect(x + dimensionOfGoose*2, y + 8, dimensionOfGoose*5, 7);   
  
 
  fill(255, 165, 0);
  rect(x + 56, y - dimensionOfGoose, dimensionOfGoose*2, dimensionOfGoose);  
  rect(x + dimensionOfGoose*4, y + dimensionOfGoose*COSTANT_BODY_GOOSE, dimensionOfGoose, dimensionOfGoose*COSTANT_BODY_GOOSE);  
  rect(x + 17, y + dimensionOfGoose*COSTANT_BODY_GOOSE, dimensionOfGoose, dimensionOfGoose*COSTANT_BODY_GOOSE);  
  rect(x + 17, y + dimensionOfGoose*6, 13, 2);  
  
  }

  void flap() {
    velocity = flapStrength;
  }
}
