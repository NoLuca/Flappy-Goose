class Goose {
  float x, y, width, height;
  float velocity = 0;
  float gravity = 0.6;
  float flapStrength = -10;

  Goose(float x, float y, float width, float height) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
  }

  void sistemGravity() {
    velocity += gravity;
    y += velocity;
  }

  void draw() {
    fill(255);
    ellipse(x, y, width, height);
  }

  void flap() {
    velocity = flapStrength;
  }
}

 