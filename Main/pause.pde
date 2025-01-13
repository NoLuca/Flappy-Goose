class Pause {
    boolean stato = true;
    int x = 5;
    int y = 5;
    int h = 50;
    int b = 50;
    Goose supportGoose;
  
    Pause(Goose goose) {
        this.supportGoose = goose;
    }

    public int getB() {
        return b;
    }

    public int getH() {
        return h;
    }

    public int getX() {
        return x;
    }

    public int getY() {
        return y;
    }
    

    public void setB(int b) {
        this.b = b;
    }

    public void setH(int h) {
        this.h = h;
    }

    public void setStato(boolean stato) {
        this.stato = stato;
    }

    public void setX(int x) {
        this.x = x;
    }

    public void setY(int y) {
        this.y = y;
    }

    void draw() {
        fill(255, 165, 0);
        rect(getX(), getY(), getH(), getB());
        fill(255);
        rect(getX() + 15, getY() * 3, getB() - 42.5, getH() - getY() * 4);
        rect(getX() + 15 + (getB() - 37.5), getY() * 3, getB() - 42.5, h - getY() * 4); 
    }

    void mouseClicked() {
        stato = !stato;
        supportGoose.systemGravity(stato);
    }

    void resume() {
        setStato(true);
        supportGoose.systemGravity(stato);
    }
  
    boolean isPaused() {
        return !stato;
    }
  
    boolean isClicked(int mouseX, int mouseY) {
        return mouseX >= getX() && mouseX <= getX() + getH() && mouseY >= getY() && mouseY <= getY() + getB();
    }
}
