class Computer {
  PVector position;
  
  Computer(float x, float y, float z) {
    position = new PVector(x, y, z);
  }
  
  void display() {
    pushMatrix();
    translate(position.x, position.y, position.z);
    drawMonitor();
    drawKeyboard();
    drawMouse();
    popMatrix();
  }



  void drawMonitor() {
    float w = 100, h = 60, d = 5;
    
    pushMatrix();
    translate(0, -30, -30);  // Adjusted height
    fill(50);
    drawBox(w, h, d); // Monitor frame
    
    fill(20);
    drawBox(90, 50, 1); // Screen
    
    // Monitor Stand
    fill(50);
    translate(0, h / 2 + 10, 2.5);
    drawBox(10, 20, 5);
    translate(0, 15, 0);
    drawBox(40, 5, 20);
    popMatrix();
  }

  void drawKeyboard() {
    pushMatrix();
    fill(80);
    translate(0, 10, 10);  // Keyboard position
    drawBox(80, 5, 30);
    popMatrix();
  }

  void drawMouse() {
    pushMatrix();
    fill(100);
    translate(45, 10, 5);  // Mouse position
    drawBox(10, 5, 15);
    popMatrix();
  }



  void drawBox(float w, float h, float d) {
    float x = w / 2, y = h / 2, z = d / 2;
  
    beginShape(QUADS);
    
    // Front face
    vertex(-x, -y, z); vertex(x, -y, z); vertex(x, y, z); vertex(-x, y, z);
    // Back face
    vertex(-x, -y, -z); vertex(x, -y, -z); vertex(x, y, -z); vertex(-x, y, -z);
    // Left face
    vertex(-x, -y, -z); vertex(-x, -y, z); vertex(-x, y, z); vertex(-x, y, -z);
    // Right face
    vertex(x, -y, -z); vertex(x, -y, z); vertex(x, y, z); vertex(x, y, -z);
    // **Fixed Top Face**
    vertex(-x, -y, -z); vertex(x, -y, -z); vertex(x, -y, z); vertex(-x, -y, z);
    // **Fixed Bottom Face**
    vertex(-x, y, -z); vertex(x, y, -z); vertex(x, y, z); vertex(-x, y, z);
    
    endShape(CLOSE);
  }

}
