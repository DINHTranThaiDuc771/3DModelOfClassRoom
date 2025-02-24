class Chair {
  PVector position;
  float seatWidth = 40;
  float seatDepth = 50;
  float seatHeight = 5;
  float legThickness = 5;
  float legHeight = 30;
  float backrestHeight = 50; 
  float backrestThickness = 5; 
  PImage chairTexture = loadImage("chairTexture.jpg");
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
    drawBox(0, seatHeight / 2, 0, seatWidth, seatHeight, seatDepth,chairTexture);
    
    // Draw the four legs
    drawBox(-(seatWidth / 2 - legThickness / 2), legHeight / 2+legThickness, -(seatDepth / 2 - legThickness / 2), legThickness, legHeight, legThickness,chairTexture); // Front left leg
    drawBox((seatWidth / 2 - legThickness / 2), legHeight / 2+legThickness, -(seatDepth / 2 - legThickness / 2), legThickness, legHeight, legThickness,chairTexture); // Front right leg
    drawBox(-(seatWidth / 2 - legThickness / 2), legHeight / 2+legThickness, (seatDepth / 2 - legThickness / 2), legThickness, legHeight, legThickness,chairTexture); // Back left leg
    drawBox((seatWidth / 2 - legThickness / 2), legHeight / 2+legThickness, (seatDepth / 2 - legThickness / 2), legThickness, legHeight, legThickness,chairTexture); // Back right leg
    
    // Draw the backrest
    drawBox(0,  - backrestHeight / 2, seatDepth / 2 - backrestThickness / 2, seatWidth, backrestHeight, backrestThickness,chairTexture);

    popMatrix();
  }

  // Helper method to draw a box (for seat, legs, and backrest)
  void drawBox(float x, float y, float z, float w, float h, float d, PImage texture) {
    pushMatrix();
    translate(x, y, z);
    textureMode(NORMAL);
    beginShape(QUADS);
    texture(texture);
  
    // Top face
    vertex(-w / 2, -h / 2, -d / 2, 0, 0);
    vertex(w / 2, -h / 2, -d / 2, 1, 0);
    vertex(w / 2, -h / 2, d / 2, 1, 1);
    vertex(-w / 2, -h / 2, d / 2, 0, 1);
  
    // Bottom face
    vertex(-w / 2, h / 2, -d / 2, 0, 0);
    vertex(w / 2, h / 2, -d / 2, 1, 0);
    vertex(w / 2, h / 2, d / 2, 1, 1);
    vertex(-w / 2, h / 2, d / 2, 0, 1);
  
    // Front face
    vertex(-w / 2, -h / 2, d / 2, 0, 0);
    vertex(w / 2, -h / 2, d / 2, 1, 0);
    vertex(w / 2, h / 2, d / 2, 1, 1);
    vertex(-w / 2, h / 2, d / 2, 0, 1);
  
    // Back face
    vertex(-w / 2, -h / 2, -d / 2, 0, 0);
    vertex(w / 2, -h / 2, -d / 2, 1, 0);
    vertex(w / 2, h / 2, -d / 2, 1, 1);
    vertex(-w / 2, h / 2, -d / 2, 0, 1);
  
    // Left face
    vertex(-w / 2, -h / 2, -d / 2, 0, 0);
    vertex(-w / 2, h / 2, -d / 2, 1, 0);
    vertex(-w / 2, h / 2, d / 2, 1, 1);
    vertex(-w / 2, -h / 2, d / 2, 0, 1);
  
    // Right face
    vertex(w / 2, -h / 2, -d / 2, 0, 0);
    vertex(w / 2, h / 2, -d / 2, 1, 0);
    vertex(w / 2, h / 2, d / 2, 1, 1);
    vertex(w / 2, -h / 2, d / 2, 0, 1);
  
    endShape(CLOSE);
    popMatrix();
  }

}
