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
  
  color screenColor = color(0);  // Black screen
  color standColor = color(50);  // Dark gray stand
  color baseColor = color(100);  // Lighter gray base

  LargeMonitor(float x, float y, float z) {
    position = new PVector(x, y, z);
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y, position.z);

    // Draw screen
    fill(screenColor);
    drawBox(0, -standHeight - screenHeight / 2, 0, screenWidth, screenHeight, screenDepth);

    // Draw stand pole
    fill(standColor);
    drawBox(0, -standHeight / 2, 0, standWidth, standHeight, standWidth);

    // Draw stand base
    fill(baseColor);
    drawBox(0, baseThickness / 2, 0, baseWidth, baseThickness, baseDepth);

    popMatrix();
  }

  void drawBox(float x, float y, float z, float w, float h, float d) {
    pushMatrix();
    translate(x, y, z);
    box(w, h, d);
    popMatrix();
  }
}
