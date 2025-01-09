class Goose {
  float x = 320;
  float y = 320;
  float velocity = 0;
  float gravity = 0.6;
  float flapStrength = -10;

  
  void sistemGravity() {
    velocity += gravity;
    y += velocity;
  }

  void draw() {
    
  background(0); 
  noStroke();
  fill(255);
  rect(x, y, 45, 15);     
  rect(x + 31, y - 15, 25, 15);  // Secondo blocco (in alto a destra)
  rect(x + 10, y + 8, 25, 7);    // Terzo blocco (in basso a destra)
  
 
  fill(255, 165, 0);
  rect(x + 56, y - 5, 10, 5);  
  rect(x + 20, y + 15, 5, 15);  
  rect(x + 17, y + 15, 5, 15);  
  rect(x + 17, y + 30, 13, 2);  
  
  }

  void flap() {
    velocity = flapStrength;
  }
}
