class Collision{
    float x;
    float y;
    float width;
    float height;

    Collision(float x, float y, float width, float height){
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
    }

    boolean intersects(Collision other){
        return !(x > other.x + other.width || x + width < other.x || y > other.y + other.height || y + height < other.y);
    }
}