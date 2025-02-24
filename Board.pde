class Board {
  PVector position;
  float boardWidth = 600;
  float boardHeight = 300;
  float boardDepth = 5;

  color boardColor = color(255);  // White surface
  PImage boardTexture = loadImage("chalkGreen.jpg");
  Board(float x, float y, float z) {
    position = new PVector(x, y, z);
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y, position.z);


    // Draw white board surface
    fill(boardColor);
    textureMode(NORMAL); // Set texture mode to NORMAL
    beginShape(QUADS);
        texture(boardTexture);
        drawBox(0, 0, 0, boardWidth, boardHeight, boardDepth - 1);
    endShape(CLOSE);
    popMatrix();
  }

  void drawBox(float x, float y, float z, float w, float h, float d) {
    noStroke();
    translate(x, y, z);

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
  }
}
