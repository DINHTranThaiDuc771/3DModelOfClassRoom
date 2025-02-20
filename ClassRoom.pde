Camera cam;

int roomWidth = 800;
int roomHeight = 400;
int roomDepth = 600;

void setup() {
  size(800, 600, P3D);
  cam = new Camera(width / 2, height / 2, 200);
}

void draw() {
  background(100, 100, 150);
  lights();

  cam.update();  // Update the camera
  translate(0, 0, -roomDepth / 2);  // Center the room

  drawRoom();
}

void drawRoom() {
  stroke(0);
  fill(150, 200, 250);  // Light blue walls

  // Floor
  pushMatrix();
  fill(180);  // Gray floor
  translate(0, roomHeight / 2, 0);
  box(roomWidth, 10, roomDepth);
  popMatrix();

  // Ceiling
  pushMatrix();
  fill(220);  // Light gray ceiling
  translate(0, -roomHeight / 2, 0);
  box(roomWidth, 10, roomDepth);
  popMatrix();

  // Back wall
  pushMatrix();
  fill(150, 200, 250);
  translate(0, 0, roomDepth / 2);
  box(roomWidth, roomHeight, 10);
  popMatrix();

  // Left wall
  pushMatrix();
  fill(150, 200, 250);
  translate(-roomWidth / 2, 0, 0);
  box(10, roomHeight, roomDepth);
  popMatrix();

  // Right wall
  pushMatrix();
  fill(150, 200, 250);
  translate(roomWidth / 2, 0, 0);
  box(10, roomHeight, roomDepth);
  popMatrix();
}
