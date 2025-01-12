class Goose{
  float x = 320;
  float y = 100;
  float velocity = 0;
  float gravity = 0.6;
  float flapStrength = -10;
  int dimensionOfGoose = 5;
  final int COSTANT_BODY_GOOSE = 3;
  boolean gravityEnabled = true;

  void sistemGravity(boolean thereIsGravity){
    gravityEnabled = thereIsGravity;
    if(!gravityEnabled){
      velocity = 0; // Ferma il movimento
    }
  }

  void draw(){
    if(gravityEnabled){
      velocity += gravity;
      y += velocity;
    }

    // Disegno dell'oca
    noStroke();
    fill(255);
    rect(x, y, dimensionOfGoose * 9, dimensionOfGoose * COSTANT_BODY_GOOSE); // Corpo
    rect(x + 31, y - dimensionOfGoose * COSTANT_BODY_GOOSE, dimensionOfGoose * 5, dimensionOfGoose * COSTANT_BODY_GOOSE); // Testa
    rect(x + dimensionOfGoose * 2, y + 8, dimensionOfGoose * 5, 7); // Ala

    fill(255, 165, 0);
    rect(x + 56, y - dimensionOfGoose, dimensionOfGoose * 2, dimensionOfGoose); // Becco
    rect(x + dimensionOfGoose * 4, y + dimensionOfGoose * COSTANT_BODY_GOOSE, dimensionOfGoose, dimensionOfGoose * COSTANT_BODY_GOOSE); // Gamba 1
    rect(x + 17, y + dimensionOfGoose * COSTANT_BODY_GOOSE, dimensionOfGoose, dimensionOfGoose * COSTANT_BODY_GOOSE); // Gamba 2
    rect(x + 17, y + dimensionOfGoose * 6, 13, 2); // Piede
    fill(198, 233, 249, 120);
    rect(x + 26, (y-5) - dimensionOfGoose * COSTANT_BODY_GOOSE, dimensionOfGoose * 9 , dimensionOfGoose * 5);
  }

  void flap(){
    if(gravityEnabled){
      velocity = flapStrength; // Salto verso l'alto
    }
  }

  Collision getHitBox(){
    return new Collision(x, y, dimensionOfGoose * 9, dimensionOfGoose * COSTANT_BODY_GOOSE, false);
  }

  boolean isOffScreen(){
    return y < 0 || y > height;
  }
}
