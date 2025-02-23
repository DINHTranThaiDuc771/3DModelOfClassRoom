Camera cam;
Computer myDell;
Chair chair;
Table table;
int gridSize = 200;  // Spacing between grid lines
int gridCount = 3; // Number of lines per direction
int roomWidth = 800;
int roomHeight = 400;
int roomDepth = 1200;
PShader shader;
PVector[] lightPos = { 
  new PVector(0, -roomDepth/2, -roomHeight/2),
  new PVector(-2000, 2000, 2000),
  new PVector(-2000, 2000, -2000),
  new PVector(2000, -2000, 2000)
};

PVector[] lightColor = {
  new PVector(150, 150, 150),  // Dimmed white light
  new PVector(150, 150, 150),  
  new PVector(150, 150, 150),  
  new PVector(150,150, 150),  
};

void setup() {
  size(800, 600, P3D);
  shader = loadShader("LightShaderTexFrag.glsl", "LightShaderTexVert.glsl");

  cam = new Camera(0,0,0);
  myDell = new Computer(0, 0, 0); // Position of the computer
  chair = new Chair (0,0,0);
  table = new Table (0,80,0);
}

void draw() {
  background(0, 0, 0);
  shader(shader);
  cam.update();  // Update the camera
  for(int i=0; i<lightPos.length; i++) {
    pointLight(lightColor[i].x, lightColor[i].y, lightColor[i].z, 
               lightPos[i].x, lightPos[i].y, lightPos[i].z);
  }   
  //Light Source Test
  fill(255);
  for(int i=0; i<lightPos.length; i++) {
      pushMatrix();
          noStroke();
          translate(lightPos[i].x, lightPos[i].y, lightPos[i].z);
          box(10, 10, 10);
      popMatrix();
  }

  drawFull3DGrid();
  myDell.display();
  //chair.display();
  table.display();
  drawRoom();
  //Camera position
  println("Camera Position -> X: " + nf(cam.position.x, 1, 2) + 
          " | Y: " + nf(cam.position.y, 1, 2) + 
          " | Z: " + nf(cam.position.z, 1, 2));
}

void drawRoom() {
  stroke(0);
  fill(150, 200, 250);  // Light blue walls
  
  // Floor
  pushMatrix();
  fill(180);  // Gray floor
  translate(0, roomHeight / 2, 0);
  beginShape();
  vertex(-roomWidth / 2, 0, -roomDepth / 2);
  vertex(roomWidth / 2, 0, -roomDepth / 2);
  vertex(roomWidth / 2, 0, roomDepth / 2);
  vertex(-roomWidth / 2, 0, roomDepth / 2);
  endShape(CLOSE);
  popMatrix();

  // Ceiling
  pushMatrix();
  fill(220);  // Light gray ceiling
  translate(0, -roomHeight / 2, 0);
  beginShape();
  vertex(-roomWidth / 2, 0, -roomDepth / 2);
  vertex(roomWidth / 2, 0, -roomDepth / 2);
  vertex(roomWidth / 2, 0, roomDepth / 2);
  vertex(-roomWidth / 2, 0, roomDepth / 2);
  endShape(CLOSE);
  popMatrix();

  // Back wall
  pushMatrix();
  fill(150, 200, 250);
  translate(0, 0, roomDepth / 2);
  beginShape();
  vertex(-roomWidth / 2, -roomHeight / 2, 0);
  vertex(roomWidth / 2, -roomHeight / 2, 0);
  vertex(roomWidth / 2, roomHeight / 2, 0);
  vertex(-roomWidth / 2, roomHeight / 2, 0);
  endShape(CLOSE);
  popMatrix();

  // Left wall
  pushMatrix();
  fill(150, 200, 250);
  translate(-roomWidth / 2, 0, 0);
  beginShape();
  vertex(0, -roomHeight / 2, -roomDepth / 2);
  vertex(0, roomHeight / 2, -roomDepth / 2);
  vertex(0, roomHeight / 2, roomDepth / 2);
  vertex(0, -roomHeight / 2, roomDepth / 2);
  endShape(CLOSE);
  popMatrix();

  // Right wall
  pushMatrix();
  fill(150, 200, 250);
  translate(roomWidth / 2, 0, 0);
  beginShape();
  vertex(0, -roomHeight / 2, -roomDepth / 2);
  vertex(0, roomHeight / 2, -roomDepth / 2);
  vertex(0, roomHeight / 2, roomDepth / 2);
  vertex(0, -roomHeight / 2, roomDepth / 2);
  endShape(CLOSE);
  popMatrix();

  // Front Wall
  pushMatrix();
  fill(150, 200, 250);
  translate(0, 0, -roomDepth / 2);
  beginShape();
  vertex(-roomWidth / 2, -roomHeight / 2, 0);
  vertex(roomWidth / 2, -roomHeight / 2, 0);
  vertex(roomWidth / 2, roomHeight / 2, 0);
  vertex(-roomWidth / 2, roomHeight / 2, 0);
  endShape(CLOSE);
  popMatrix();
}

void drawFull3DGrid() {
  strokeWeight(1);
  stroke(200);  // Light gray grid lines

  // Generate multiple planes along X, Y, and Z
  for (int i = -gridCount; i <= gridCount; i++) {
    float offset = i * gridSize;

    // Parallel planes along the X-axis (YZ planes)
    drawGridYZ(offset);

    // Parallel planes along the Y-axis (XZ planes)
    drawGridXZ(offset);

    // Parallel planes along the Z-axis (XY planes)
    drawGridXY(offset);
  }
  
  // Draw X, Y, Z axes
  drawAxes();
}

void drawGridYZ(float x) {
  for (int i = -gridCount; i <= gridCount; i++) {
    float pos = i * gridSize;
    
    // Vertical lines in the YZ plane
    line(x, -gridCount * gridSize, pos, x, gridCount * gridSize, pos);
    
    // Horizontal lines in the YZ plane
    line(x, pos, -gridCount * gridSize, x, pos, gridCount * gridSize);
  }
}

void drawGridXZ(float y) {
  for (int i = -gridCount; i <= gridCount; i++) {
    float pos = i * gridSize;
    
    // Vertical lines in the XZ plane
    line(-gridCount * gridSize, y, pos, gridCount * gridSize, y, pos);
    
    // Horizontal lines in the XZ plane
    line(pos, y, -gridCount * gridSize, pos, y, gridCount * gridSize);
  }
}

void drawGridXY(float z) {
  for (int i = -gridCount; i <= gridCount; i++) {
    float pos = i * gridSize;
    
    // Vertical lines in the XY plane
    line(-gridCount * gridSize, pos, z, gridCount * gridSize, pos, z);
    
    // Horizontal lines in the XY plane
    line(pos, -gridCount * gridSize, z, pos, gridCount * gridSize, z);
  }
}

void drawAxes() {
  strokeWeight(3);

  // X Axis (Red)
  stroke(255, 0, 0);
  line(0, 0, 0, gridCount * gridSize, 0, 0);
  
  // Y Axis (Green)
  stroke(0, 255, 0);
  line(0, 0, 0, 0, gridCount * gridSize, 0);
  
  // Z Axis (Blue)
  stroke(0, 0, 255);
  line(0, 0, 0, 0, 0, gridCount * gridSize);
}
