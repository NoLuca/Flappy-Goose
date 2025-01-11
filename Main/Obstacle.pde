class Obstacle{
    private float x;
    private float y;
    private float size;
    private float speedX;
    private float speedY;
    private color obstacleColor;

    public Obstacle(){
        size = random(20, 50);
        x = width;
        y = random(height);
        speedX = random(-3, -1.5);
        speedY = random(-1, 1);
        obstacleColor = color(random(255), random(255), random(255));
    }

    public void draw(){
        fill(obstacleColor);
        noStroke();
        rect(x, y, size, size);
    }

    public void update(){
        x += speedX;
        y += speedY;

        if (y < 0 || y + size > height) {
            speedY *= -1;
        }
    }

    public boolean isOffScreen(){
        return x + size < 0;
    }
    
    Collision getHitBox(){
        return new Collision(x, y, size, size);
    }
}