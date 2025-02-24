class Computer {
  PVector position;
  PImage keyboardTexture;
  PImage screenTexture;
  PImage black;
  PImage mouseTexture;
  float keyBoardThickness = 3;
  Computer(float x, float y, float z) {
    position = new PVector(x, y, z);
    LoadTextureImages();
  }
  
  void display() {
    pushMatrix();
    translate(position.x, position.y, position.z);
    noStroke();
    drawMonitor();
    drawKeyboard();
    drawMouse();
    popMatrix();
  }

  void LoadTextureImages(){
    keyboardTexture = loadImage("keyboardTex.jpg");
    mouseTexture = loadImage("mouseTexture.png");
    black = loadImage("black.jpg");

  }

  void drawMonitor() {    
    drawBox(0,-30,-30,90, 60, 1,black); // Screen 
  }

  void drawKeyboard() {
    drawBoxWithTextureOnTop(0,0,10,80,keyBoardThickness,30,keyboardTexture,black);
  }
  void drawBoxWithTextureOnTop(float x,float y, float z, float w, float h, float d,PImage textureTop,PImage otherTexture){
    pushMatrix();
    translate(x, y, z);
    beginShape(QUADS);
      texture(textureTop);
      // Top face (where the texture will be applied)
      vertex(-w / 2, -h / 2, -d / 2, 0, 0);  // Vertex coordinates with texture mapping (x, y, z, u, v)
      vertex(w / 2, -h / 2, -d / 2, 1, 0);
      vertex(w / 2, -h / 2, d / 2, 1, 1);
      vertex(-w / 2, -h / 2, d / 2, 0, 1);
    endShape(CLOSE);
    beginShape(QUADS);
      texture(otherTexture);
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
  void drawMouse() {
    drawBoxWithTextureOnTop(60,0,5,8,keyBoardThickness-2,10,mouseTexture,black);
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
