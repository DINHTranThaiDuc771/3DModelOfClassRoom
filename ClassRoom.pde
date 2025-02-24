Camera cam;

WorkSpace workspace;
LargeMonitor largeMonitor;
Board board;
boolean show3DGrid = false;
int gridSize = 200;  // Spacing between grid lines
int gridCount = 3; // Number of lines per direction
int roomWidth = 800;
int roomHeight = 400;
int roomDepth = 1200;
PShader shader;
ArrayList<WorkSpace> workspaces = new ArrayList<WorkSpace>();
PImage wallTexture,floorTexture,cellingTexture,bulbTexture,slimeTexture ;
PVector[] lightPos = { 
  new PVector(0, -roomHeight/2+5, -roomDepth/2+25),
  new PVector(0, -roomHeight/2+5, 0),
  new PVector(0, -roomHeight/2+5, roomDepth/2-25),
  new PVector(1500, 1500,1500),
};

PVector[] lightColor = {
  new PVector(155, 155, 155),  // Dimmed white light
  new PVector(155, 155, 155),  
  new PVector(100, 100, 100),
  new PVector(100, 100, 100)
};
//Attribut slime
float slimeMoveSpeed = 2;
float xMin = -roomWidth/2 +50;
float xMax = roomWidth/2 - 50;
float xPos = 0;
void setup() {
  size(800, 600, P3D);
  shader = loadShader("LightShaderTexFrag.glsl", "LightShaderTexVert.glsl");
  //Load textures for classroom
  wallTexture = loadImage("wallTexture.png");
  floorTexture = loadImage("floorTexture.png");
  cellingTexture = loadImage("cellingTexture.jpg");
  bulbTexture = loadImage("white.png");
  slimeTexture = loadImage("slime.jpg");
  //Load objects instances
  cam = new Camera(0,0,0);
  float yWorkSpace = roomHeight/2-35; //35 is tableHeight/2
  float xStart = -135;
  float zStart = -135;
  workspace = new WorkSpace(xStart,yWorkSpace,zStart);
  largeMonitor = new LargeMonitor(-roomWidth/2+400,roomHeight/2-5,-roomDepth/2+50);
  board = new Board (0,0,-roomDepth/2+5);
  float tableWidth = workspace.table.tableWidth;
  float spaceBetweenLines = workspace.table.tableDepth+50;
  for (int i = 0; i<4;i++) { 
    for (int j = 0; j <4 ;j++) {
        WorkSpace w =  new WorkSpace(xStart+i*tableWidth+5,yWorkSpace,zStart+j*spaceBetweenLines);
        workspaces.add(w);
    }
  
  }
}

void draw() {
  background(100, 100, 255);
  shader(shader);
  cam.update();  // Update the camera
  for(int i=0; i<lightPos.length; i++) {
    pointLight(lightColor[i].x, lightColor[i].y, lightColor[i].z,lightPos[i].x, lightPos[i].y, lightPos[i].z);
    drawBox(lightPos[i].x, lightPos[i].y, lightPos[i].z,10,10,50,bulbTexture);
           
  }

  if (show3DGrid) drawFull3DGrid();
  for (WorkSpace w : workspaces) {
    w.display();
  }
  pushMatrix();
    rotateY(PI/8);
    largeMonitor.display();
  popMatrix();
  board.display();
  drawRoom(wallTexture,floorTexture,cellingTexture);
  //Animation Slime
  xPos += slimeMoveSpeed;
  if (xPos > xMax || xPos < xMin) {
    slimeMoveSpeed *= -1; // Reverse direction
  }
  drawBox(xPos,roomHeight/2-75,-300,50,150,50,slimeTexture);
}
void mousePressed(){
  show3DGrid = !show3DGrid;
}
void drawRoom(PImage wallTexture, PImage floorTexture, PImage ceilingTexture) {
  stroke(0);
  textureMode(NORMAL);  // Use NORMALIZED texture coordinates (0 to 1)

  // Floor
  pushMatrix();
  beginShape();
  texture(floorTexture);
  vertex(-roomWidth / 2, roomHeight / 2, -roomDepth / 2, 0, 0);
  vertex(roomWidth / 2, roomHeight / 2, -roomDepth / 2, 1, 0);
  vertex(roomWidth / 2, roomHeight / 2, roomDepth / 2, 1, 1);
  vertex(-roomWidth / 2, roomHeight / 2, roomDepth / 2, 0, 1);
  endShape(CLOSE);
  popMatrix();

  // Ceiling 
  pushMatrix();
  beginShape();
  texture(ceilingTexture);
  vertex(-roomWidth / 2, -roomHeight / 2, -roomDepth / 2, 0, 0);  // top-left
  vertex(-roomWidth / 2, -roomHeight / 2, roomDepth / 2, 0, 1);   // bottom-left
  vertex(roomWidth / 2, -roomHeight / 2, roomDepth / 2, 1, 1);    // bottom-right
  vertex(roomWidth / 2, -roomHeight / 2, -roomDepth / 2, 1, 0);   // top-right
  endShape(CLOSE);
  popMatrix();


  // Back Wall 
  pushMatrix();
  beginShape();
  texture(wallTexture);
  vertex(-roomWidth / 2, -roomHeight / 2, roomDepth / 2, 0, 1);
  vertex(-roomWidth / 2, roomHeight / 2, roomDepth / 2, 0, 0);
  vertex(roomWidth / 2, roomHeight / 2, roomDepth / 2, 1, 0);
  vertex(roomWidth / 2, -roomHeight / 2, roomDepth / 2, 1, 1);
  endShape(CLOSE);
  popMatrix();

  // Left Wall 
  pushMatrix();
  beginShape();
  texture(wallTexture);
  vertex(-roomWidth / 2, -roomHeight / 2, -roomDepth / 2, 0, 0);
  vertex(-roomWidth / 2, roomHeight / 2, -roomDepth / 2, 1, 0);
  vertex(-roomWidth / 2, roomHeight / 2, roomDepth / 2, 1, 1);
  vertex(-roomWidth / 2, -roomHeight / 2, roomDepth / 2, 0, 1);
  endShape(CLOSE);
  popMatrix();

  // Right Wall 
  pushMatrix();
  beginShape();
  texture(wallTexture);
  vertex(roomWidth / 2, -roomHeight / 2, roomDepth / 2, 0, 1);
  vertex(roomWidth / 2, roomHeight / 2, roomDepth / 2, 0, 0);
  vertex(roomWidth / 2, roomHeight / 2, -roomDepth / 2, 1, 0);
  vertex(roomWidth / 2, -roomHeight / 2, -roomDepth / 2, 1, 1);
  endShape(CLOSE);
  popMatrix();

  // Front Wall 
  pushMatrix();
  translate(0, 0, -roomDepth / 2);
  beginShape();
  texture(wallTexture);
  vertex(-roomWidth / 2, -roomHeight / 2, 0, 0, 0);
  vertex(roomWidth / 2, -roomHeight / 2, 0, 1, 0);
  vertex(roomWidth / 2, roomHeight / 2, 0, 1, 1);
  vertex(-roomWidth / 2, roomHeight / 2, 0, 0, 1);
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
