class Camera {
  PVector position;
  float yaw = -PI/2, pitch = 0;
  // pitch : Rotate sur y axis
  // yaw : Rotate sur X axis
  // Dans le cas de notre utilisation, on n'utilise pas "roll"
  float moveSpeed = 5;
  float sensitivity = 0.02;
  
  public Camera(float x, float y, float z) {
    position = new PVector(x, y, z);
  }
  
  void update() {
    handleRotation();
    handleMovement();
    applyCamera();
  }
  
  void handleRotation() {
    if (keyPressed) {
      if (keyCode == LEFT) yaw -= sensitivity * 10;
      if (keyCode == RIGHT) yaw += sensitivity * 10;
      if (keyCode == UP) pitch -= sensitivity * 10;
      if (keyCode == DOWN) pitch += sensitivity * 10;
    }
    pitch = constrain(pitch, -PI / 2, PI / 2);
  }
  
  void handleMovement() {
    PVector forward = new PVector(cos(yaw) * cos(pitch), sin(pitch), sin(yaw) * cos(pitch));
    PVector right = new PVector(-sin(yaw), 0, cos(yaw));
    
    if (keyPressed) {
        if (key == 'z' || key == 'Z') position.add(PVector.mult(forward, moveSpeed));
        if (key == 's' || key == 'S') position.sub(PVector.mult(forward, moveSpeed));
        if (key == 'q' || key == 'Q') position.sub(PVector.mult(right, moveSpeed));
        if (key == 'd' || key == 'D') position.add(PVector.mult(right, moveSpeed));
    }
  }
  
  void applyCamera() {
    camera(position.x, position.y, position.z,
           position.x + cos(yaw), position.y + sin(pitch), position.z + sin(yaw),
           0, 1, 0);
  }
}
