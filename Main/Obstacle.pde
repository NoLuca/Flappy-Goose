class Obstacle{
    float x;
    float y;
    float size;
    float speedX;
    float speedY;
    color obstacleColor;

    Obstacle(){
        size = random(50, 75);
        x = width;
        y = random(height);
        speedX = random(-3, -1.5);
        speedY = random(-1, 1);
        obstacleColor = color(60, 50, 46);
    }

    void draw(){
        fill(255, 30, 0);
        triangle(x, y-size/2, x, y+size/2, x+size*2, y);
      
        fill(255, 165, 0);
        triangle(x, y-size/2, x, y+size/2, x+size, y);
      
       
        
        
        
        fill(obstacleColor);
        noStroke();
        ellipse(x, y, size, size);
        
        
        
    }

    void update(){
        x += speedX;
        y += speedY;

        if (y < 0 || y + size > height) {
            speedY *= -1;
        }
    }

    boolean isOffScreen(){
        return x + size < 0;
    }
    
    Collision getHitBox() {
    return new Collision(x, y, size, size, true);
}
}