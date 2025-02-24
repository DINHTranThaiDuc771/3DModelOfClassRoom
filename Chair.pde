class Chair {
  PVector position;
  float seatWidth = 40;
  float seatDepth = 50;
  float seatHeight = 5;
  float legThickness = 5;
  float legHeight = 30;
  float backrestHeight = 50; 
  float backrestThickness = 5; 
  
  // Constructor accepting x, y, z for position
  Chair(float x, float y, float z) {
    position = new PVector(x, y, z);
  }

  // Method to display the chair
  void display() {
    pushMatrix();
    translate(position.x, position.y, position.z);
    noStroke();
    // Draw the seat
    fill(150, 100, 50);  // Brown color for the seat
    drawBox(0, seatHeight / 2, 0, seatWidth, seatHeight, seatDepth);
    
    // Draw the four legs
    fill(100, 50, 20);  // Dark brown color for the legs
    drawBox(-(seatWidth / 2 - legThickness / 2), legHeight / 2+legThickness, -(seatDepth / 2 - legThickness / 2), legThickness, legHeight, legThickness); // Front left leg
    drawBox((seatWidth / 2 - legThickness / 2), legHeight / 2+legThickness, -(seatDepth / 2 - legThickness / 2), legThickness, legHeight, legThickness); // Front right leg
    drawBox(-(seatWidth / 2 - legThickness / 2), legHeight / 2+legThickness, (seatDepth / 2 - legThickness / 2), legThickness, legHeight, legThickness); // Back left leg
    drawBox((seatWidth / 2 - legThickness / 2), legHeight / 2+legThickness, (seatDepth / 2 - legThickness / 2), legThickness, legHeight, legThickness); // Back right leg
    
    // Draw the backrest
    fill(150, 100, 50);  // Same color for the backrest as the seat
    drawBox(0,  - backrestHeight / 2, seatDepth / 2 - backrestThickness / 2, seatWidth, backrestHeight, backrestThickness);

    popMatrix();
  }

  // Helper method to draw a box (for seat, legs, and backrest)
  void drawBox(float x, float y, float z, float w, float h, float d) {
    pushMatrix();
    translate(x, y, z);
    beginShape(QUADS);

    // Top face
    vertex(-w / 2, -h / 2, -d / 2);
    vertex(w / 2, -h / 2, -d / 2);
    vertex(w / 2, -h / 2, d / 2);
    vertex(-w / 2, -h / 2, d / 2);

    // Bottom face
    vertex(-w / 2, h / 2, -d / 2);
    vertex(w / 2, h / 2, -d / 2);
    vertex(w / 2, h / 2, d / 2);
    vertex(-w / 2, h / 2, d / 2);

    // Front face
    vertex(-w / 2, -h / 2, d / 2);
    vertex(w / 2, -h / 2, d / 2);
    vertex(w / 2, h / 2, d / 2);
    vertex(-w / 2, h / 2, d / 2);

    // Back face
    vertex(-w / 2, -h / 2, -d / 2);
    vertex(w / 2, -h / 2, -d / 2);
    vertex(w / 2, h / 2, -d / 2);
    vertex(-w / 2, h / 2, -d / 2);

    // Left face
    vertex(-w / 2, -h / 2, -d / 2);
    vertex(-w / 2, h / 2, -d / 2);
    vertex(-w / 2, h / 2, d / 2);
    vertex(-w / 2, -h / 2, d / 2);

    // Right face
    vertex(w / 2, -h / 2, -d / 2);
    vertex(w / 2, h / 2, -d / 2);
    vertex(w / 2, h / 2, d / 2);
    vertex(w / 2, -h / 2, d / 2);

    endShape(CLOSE);
    popMatrix();
  }
}
