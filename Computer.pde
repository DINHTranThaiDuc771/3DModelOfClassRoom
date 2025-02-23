class Computer {
  PVector position;
  PImage keyboardTexture;
  PImage screenTexture;
  PImage mouseTexture;
  float keyBoardThickness = 3;
  Computer(float x, float y, float z) {
    position = new PVector(x, y, z);
    LoadTextureImages();
  }
  
  void display() {
    pushMatrix();
    translate(position.x, position.y, position.z);
    drawMonitor();
    drawKeyboard();
    drawMouse();
    popMatrix();
  }

  void LoadTextureImages(){
    keyboardTexture = loadImage("keyboardTex.jpg");
    mouseTexture = loadImage("mouseTexture.png");
  }

  void drawMonitor() {    
    pushMatrix();
    translate(0, -30, -30);  // Adjusted height    
    fill(20);
    beginShape(QUADS);
      drawBox(90, 60, 1); // Screen 
    endShape(CLOSE);
    
    popMatrix();
  }

  void drawKeyboard() {

    pushMatrix();
    fill(80);
    translate(0, 0, 10);  // Keyboard position
    textureMode(NORMAL); // Set texture mode to NORMAL
    drawBoxWithTextureOnTop(80,keyBoardThickness,30,keyboardTexture);
    
    popMatrix();
  }
  void drawBoxWithTextureOnTop(float w, float h, float d,PImage texture){
    beginShape(QUADS);
      texture(keyboardTexture);

      texture(texture);
      // Top face (where the texture will be applied)
      vertex(-w / 2, -h / 2, -d / 2, 0, 0);  // Vertex coordinates with texture mapping (x, y, z, u, v)
      vertex(w / 2, -h / 2, -d / 2, 1, 0);
      vertex(w / 2, -h / 2, d / 2, 1, 1);
      vertex(-w / 2, -h / 2, d / 2, 0, 1);
    endShape(CLOSE);
    beginShape(QUADS);
      float x = w / 2, y = h / 2, z = d / 2;
      // Front face
      vertex(-x, -y, z); vertex(x, -y, z); vertex(x, y, z); vertex(-x, y, z);
      // Back face
      vertex(-x, -y, -z); vertex(x, -y, -z); vertex(x, y, -z); vertex(-x, y, -z);
      // Left face
      vertex(-x, -y, -z); vertex(-x, -y, z); vertex(-x, y, z); vertex(-x, y, -z);
      // Right face
      vertex(x, -y, -z); vertex(x, -y, z); vertex(x, y, z); vertex(x, y, -z);
      //Bottom Face
      vertex(-x, y, -z); vertex(x, y, -z); vertex(x, y, z); vertex(-x, y, z); 
    endShape(CLOSE);
  }
  void drawMouse() {
    pushMatrix();
    fill(100);
    translate(60, 0, 5);  // Mouse position
    textureMode(NORMAL); // Set texture mode to NORMAL
    drawBoxWithTextureOnTop(8,keyBoardThickness-2,10,mouseTexture);

    popMatrix();
  }



  void drawBox(float w, float h, float d) {
    float x = w / 2, y = h / 2, z = d / 2;
    noStroke();

    // Front face
    vertex(-x, -y, z); vertex(x, -y, z); vertex(x, y, z); vertex(-x, y, z);
    // Back face
    vertex(-x, -y, -z); vertex(x, -y, -z); vertex(x, y, -z); vertex(-x, y, -z);
    // Left face
    vertex(-x, -y, -z); vertex(-x, -y, z); vertex(-x, y, z); vertex(-x, y, -z);
    // Right face
    vertex(x, -y, -z); vertex(x, -y, z); vertex(x, y, z); vertex(x, y, -z);
    // Top Face
    vertex(-x, -y, -z); vertex(x, -y, -z); vertex(x, -y, z); vertex(-x, -y, z);
    //Bottom Face
    vertex(-x, y, -z); vertex(x, y, -z); vertex(x, y, z); vertex(-x, y, z);    
  }

}
