class LargeMonitor {
  PVector position;
  float screenWidth = 300;
  float screenHeight = 200;
  float screenDepth = 5;
  
  float standWidth = 20;
  float standHeight = 100;
  float baseWidth = 50;
  float baseDepth = 30;
  float baseThickness = 5;
  
  PImage black,darkGray,lightGray;
  LargeMonitor(float x, float y, float z) {
    position = new PVector(x, y, z);
    lightGray = loadImage("lightGray.png");
    black = loadImage("black.jpg");
    darkGray = loadImage("darkgray.png");
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y, position.z);

    // Draw screen
    drawBox(0, -standHeight - screenHeight / 2, 0, screenWidth, screenHeight, screenDepth,black);

    // Draw stand pole
    drawBox(0, -standHeight / 2, 0, standWidth, standHeight, standWidth,darkGray);

    // Draw stand base
    drawBox(0, baseThickness / 2, 0, baseWidth, baseThickness, baseDepth,lightGray);

    popMatrix();
  }

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
