class Goose{
    float x = 320;
    float y = 100;
    float velocity = 0;
    float gravity = 0.6;
    float flapStrength = -10;
    int dimensionOfGoose = 5;
    final int COSTANT_BODY_GOOSE = 3;
    boolean gravityEnabled = true;

    public int getCOSTANT_BODY_GOOSE() {
        return COSTANT_BODY_GOOSE;
    }

    public int getDimensionOfGoose() {
        return dimensionOfGoose;
    }

    public float getFlapStrength() {
        return flapStrength;
    }

    public float getGravity() {
        return gravity;
    }


    public float getX() {
        return x;
    }

    public float getVelocity() {
        return velocity;
    }

    public float getY() {
        return y;
    }

    public void setDimensionOfGoose(int dimensionOfGoose) {
        this.dimensionOfGoose = dimensionOfGoose;
    }

    public void setFlapStrength(float flapStrength) {
        this.flapStrength = flapStrength;
    }
    
    public void setGravity(float gravity) {
        this.gravity = gravity;
    }
    
    public void setGravityEnabled(boolean gravityEnabled) {
        this.gravityEnabled = gravityEnabled;
    }

    public void setVelocity(float velocity) {
        this.velocity = velocity;
    }
    public void setX(float x) {
        this.x = x;
    }
  
    public void setY(float y) {
        this.y = y;
    }

    void systemGravity(boolean thereIsGravity){
      gravityEnabled = thereIsGravity;
      if(!gravityEnabled){
        velocity = 0; // Ferma il movimento
      }
    }
  
    void draw(){
      if(gravityEnabled){
        setVelocity(getVelocity()+ getGravity());
        setY(getY()+getVelocity());
      }
  
      // Disegno dell'ocget()
      noStroke();
      fill(255);
      rect(getX(), getY(), getDimensionOfGoose() * getCOSTANT_BODY_GOOSE()*getCOSTANT_BODY_GOOSE(), getDimensionOfGoose() * getCOSTANT_BODY_GOOSE()); // Corpo
      rect(getX() + 31, getY() - getDimensionOfGoose() * getCOSTANT_BODY_GOOSE(), dimensionOfGoose * 5, dimensionOfGoose * getCOSTANT_BODY_GOOSE()); // Testa
      rect(getX() + getDimensionOfGoose() * 2, getY() + 8, dimensionOfGoose * 5, 7); // Ala
  
      fill(255, 165, 0);
      rect(getX() + 56, getY() - getDimensionOfGoose(), getDimensionOfGoose() * 2, getDimensionOfGoose()); // Becco
      rect(getX() + getDimensionOfGoose() * 4, getY() + getDimensionOfGoose() * getCOSTANT_BODY_GOOSE(), getDimensionOfGoose(), getDimensionOfGoose() * getCOSTANT_BODY_GOOSE()); // Gamba 1
      rect(getX() + 17, getY() + getDimensionOfGoose() * getCOSTANT_BODY_GOOSE(), getDimensionOfGoose(), getDimensionOfGoose() * getCOSTANT_BODY_GOOSE()); // Gamba 2
      rect(getX() + 17, getY() + getDimensionOfGoose() * getCOSTANT_BODY_GOOSE()*2, 13, 2); // Piede
      fill(198, 233, 249, 120);
      rect(getX() + 26, (getY()-5) - getDimensionOfGoose() * getCOSTANT_BODY_GOOSE(), getDimensionOfGoose() * 9 , getDimensionOfGoose() * 5);
    }
  
    void flap(){
      if(gravityEnabled){
        setVelocity(getFlapStrength()); // Salto verso l'altgetCOSTANT_BODY_GOOSE()
      }
    }
  
    Collision getHitBox(){
      return new Collision(getX(), getY(), getDimensionOfGoose() * 9, getDimensionOfGoose() * getCOSTANT_BODY_GOOSE());
    }
  
    boolean isOffScreen(){
      return getY() < 0 || getY() > height;
    }
  }
