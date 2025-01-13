class Obstacle {
    float x;
    float y;
    float size;
    float speedX;
    float speedY;
    color obstacleColor;

    public color getObstacleColor() {
        return obstacleColor;
    }

    public float getSize() {
        return size;
    }

    public float getSpeedX() {
        return speedX;
    }

    public float getSpeedY() {
        return speedY;
    }

    public float getX() {
        return x;
    }

    public float getY() {
        return y;
    }

    public void setObstacleColor(color obstacleColor) {
        this.obstacleColor = obstacleColor;
    }

    public void setSize(float size) {
        this.size = size;
    }

    public void setSpeedX(float speedX) {
        this.speedX = speedX;
    }

    public void setSpeedY(float speedY) {
        this.speedY = speedY;
    }

    public void setX(float x) {
        this.x = x;
    }

    public void setY(float y) {
        this.y = y;
    }

    Obstacle() {
        size = random(50, 75);
        x = width;
        y = random(height);
        speedX = random(-3, -1.5);
        speedY = random(-1, 1);
        obstacleColor = color(60, 50, 46);
    }

    void draw() {
        // Disegno dei triangoli
        fill(255, 30, 0);
        triangle(getX(), getY() - getSize() / 2, getX(), getY() + getSize() / 2, getX() + getSize() * 2, getY());

        fill(255, 165, 0);
        triangle(getX(), getY() - getSize() / 2, getX(), getY() + getSize() / 2, getX() + getSize(), getY());

        // Sostituzione del cerchio con un quadrato
        fill(getObstacleColor());
        noStroke();
        rect(getX() - getSize() / 2, getY() - getSize() / 2, getSize(), getSize()); // Quadrato centrato
    }

    void update() {
        setX(getX() + getSpeedX());
        setY(getY() + getSpeedY());

        if (y < 0 || y + getSize() > height) {
            setSpeedY(getSpeedY() * -1);
        }
    }

    boolean isOffScreen() {
        return getX() + getSize() < 0;
    }

    Collision getHitBox() {
        // Hitbox rettangolare
        return new Collision(getX() - getSize() / 2, getY() - getSize() / 2, getSize(), getSize());
    }
}
