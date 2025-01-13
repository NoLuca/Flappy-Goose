class Collision{
    float x;
    float y;
    float width;
    float height;

    public void setHeight(float height) {
        this.height = height;
    }

    public void setWidth(float width) {
        this.width = width;
    }

    public void setY(float y) {
        this.y = y;
    }

    public void setX(float x) {
        this.x = x;
    }

    public float getHeight() {
        return height;
    }

    public float getX() {
        return x;
    }
    
    public float getWidth() {
        return width;
    }
    
    public float getY() {
        return y;
    }

    Collision(float x, float y, float width, float height){
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
    }

    boolean intersects(Collision collisionToCheck){
        return !(getX() > collisionToCheck.getX() + collisionToCheck.getWidth() || getX() + getWidth() < collisionToCheck.getX() || getY() > collisionToCheck.getY() + collisionToCheck.getHeight() || getY() + getHeight() < collisionToCheck.getY());
    }
}
