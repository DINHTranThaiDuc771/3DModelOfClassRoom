class Camera {
  PVector position;
  float rotX = 0;
  float rotY = 0;
  float zoom = 1000;

  Camera(float x, float y, float z) {
    position = new PVector(x, y, z);
  }

  void update() {
    // Apply zoom and set the camera
    camera(position.x, position.y, zoom, position.x, position.y, 0, 0, 1, 0);
    // Apply rotation
    rotateX(rotX);
    rotateY(rotY);
  }

  void rotate(float dx, float dy) {
    float sensitivity = 0.01;
    rotY += dx * sensitivity;
    rotX += dy * sensitivity;
  }

  void move(int dirX, int dirY) {
    int moveAmount = 20;
    position.x += dirX * moveAmount;
    position.y += dirY * moveAmount;
  }

  void zoom(float delta) {
    zoom += delta * 50;
    zoom = constrain(zoom, 500, 3000);
  }
}
