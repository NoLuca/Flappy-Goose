class Obstacle{
    float x;
    float y;
    float size;
    float speedX;
    float speedY;
    color obstacleColor;

    Obstacle(){
        size = random(20, 50);
        x = width;
        y = random(height);
        speedX = random(-3, -1);
        speedY = random(-3, 3);
        obstacleColor = color(random(255), random(255), random(255));
    }

    void draw(){
        fill(obstacleColor);
        noStroke();
        rect(x, y, size, size);
    }

    void update(){
        x += speedX;
        y += speedY;
    }
}