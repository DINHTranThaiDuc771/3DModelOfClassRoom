class Table {
  PVector position;
  float tableWidth = 150;
  float tableDepth = 100;
  float tableHeight = 70;
  float legThickness = 10;
  float legDepth = 60;
  float tableTopHeight = 5;
  float tableFrontThickNess = 20;
  color gray = color(150);
  color brown = color(139, 69, 19);
  PImage textureTable,metalTexture;
  PImage lightBrown;
  Table(float x, float y, float z) {
    position = new PVector(x, y, z);
    LoadTextureImages();
  }

  void LoadTextureImages() {
    textureTable = loadImage("tableTex.jpg");
    metalTexture = loadImage("metalTexture.png");
    lightBrown = loadImage("lightBrown.jpg");
  }

  void display() {
    pushMatrix();
    noStroke();
    translate(position.x, position.y, position.z);

    // Draw table top with texture
    drawTableTop(0, -tableHeight / 2, 0, tableWidth, tableTopHeight, tableDepth);

    pushMatrix();
    // Draw Table front
    translate(0, 0, tableFrontThickNess / 2);
    drawBox(0, 0, -tableDepth / 2, tableWidth, tableHeight - tableTopHeight, tableFrontThickNess,metalTexture);
    popMatrix();

    // Draw 4 "legs" of table front
    float legX = tableWidth / 2 - legThickness / 2;
    float legY = -tableHeight / 2 + legThickness / 2 + tableTopHeight / 2;
    float legZ = -tableDepth / 2 + tableFrontThickNess + legDepth / 2;
    drawBox(legX, legY, legZ, legThickness, legThickness, legDepth,metalTexture);
    drawBox(-legX, -legY, legZ, legThickness, legThickness, legDepth,metalTexture); // Symmetry by plane XY
    drawBox(legX, -legY, -legZ, legThickness, legThickness, legDepth,metalTexture); // Symmetry by plane YZ
    drawBox(-legX, legY, -legZ, legThickness, legThickness, legDepth,metalTexture); // Symmetry by plane XZ

    popMatrix();
  }

  //draw the table top 
  void drawTableTop(float x, float y, float z, float w, float h, float d) {
    drawBoxWithTextureOnTop(x,y,z,w,h,d,textureTable,lightBrown);

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
  // Draw basic box with texture
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
