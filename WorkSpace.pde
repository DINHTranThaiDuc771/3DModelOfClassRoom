class WorkSpace{
    PVector position;
    Table table;
    Computer computer;
    WorkSpace(float x, float y, float z) {
      position = new PVector(x, y, z);
      table = new Table(0,0,0);
      computer = new Computer(0,0,0);
    }
    void display(){
      pushMatrix();
      translate(position.x, position.y, position.z);
      computer.display();
      table.display();
      popMatrix();
    }
}
