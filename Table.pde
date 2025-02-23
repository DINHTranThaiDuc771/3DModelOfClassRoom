class Table {
  PVector position;
  float tableWidth = 150;
  float tableDepth = 100;
  float tableHeight = 70;
  float legThickness = 10;
  float legDepth = 60;
  float tableTopHeight = 5;
  float tableFrontThickNess = 20;
  color gray = color (150);
  color brown = color(139, 69, 19);
  Table(float x, float y, float z) {
    position = new PVector(x, y, z);
    LoadTextureImages();
  }
  void LoadTextureImages(){
    
  }
  void display() {
    pushMatrix();
    noStroke();
    translate(position.x, position.y, position.z);
    // Draw table top
    fill(brown);  // Brown wood color
    drawBox(0, -tableHeight /2 , 0, tableWidth, tableTopHeight, tableDepth);
    

    pushMatrix();
    // Draw Table front
    fill (gray);
    translate(0,0,tableFrontThickNess/2);
    drawBox(0,0,-tableDepth/2,tableWidth, tableHeight-tableTopHeight, tableFrontThickNess);
    popMatrix();
    //Draw 4 "legs" of table front
    float legX = tableWidth/2-legThickness/2;
    float legY = -tableHeight/2+legThickness/2+tableTopHeight/2;
    float legZ = -tableDepth/2+tableFrontThickNess+legDepth/2;
    drawBox(legX,legY,legZ,legThickness, legThickness, legDepth);
    drawBox(-legX,-legY,legZ,legThickness, legThickness, legDepth);//Symétrie par plane XY
    drawBox(legX,-legY,-legZ,legThickness, legThickness, legDepth);//Symétrie par plane YZ
    drawBox(-legX,legY,-legZ,legThickness, legThickness, legDepth);//Symétrie par plane XZ

    popMatrix();
  }

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
