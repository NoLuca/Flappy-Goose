class Collision{
    float x;
    float y;
    float width;
    float height;
    boolean isCircle;

    Collision(float x, float y, float width, float height, boolean isCircle){
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
        this.isCircle = isCircle;
    }

    boolean intersects(Collision other){
        if(this.isCircle && other.isCircle){
            // Cerchio-Cerchio
            float dx = this.x - other.x;
            float dy = this.y - other.y;
            float distance = sqrt(dx * dx + dy * dy);
            return distance < (this.width / 2 + other.width / 2);
        }else if(this.isCircle || other.isCircle){
            // Cerchio-Rettangolo
            Collision circle = this.isCircle ? this : other;
            Collision rect = this.isCircle ? other : this;

            float circleCenterX = circle.x;
            float circleCenterY = circle.y;
            float radius = circle.width / 2;

            float closestX = constrain(circleCenterX, rect.x, rect.x + rect.width);
            float closestY = constrain(circleCenterY, rect.y, rect.y + rect.height);

            float dx = circleCenterX - closestX;
            float dy = circleCenterY - closestY;

            return (dx * dx + dy * dy) < (radius * radius);
        }else{
            // Rettangolo-Rettangolo (originale)
            return !(x > other.x + other.width || x + width < other.x || y > other.y + other.height || y + height < other.y);
        }
    }
}
