class WorkSpace{
    PVector position;
    Table table;
    Computer computer;
    Chair chair;
    WorkSpace(float x, float y, float z) {
      position = new PVector(x, y, z);
      table = new Table(0,0,0);
      computer = new Computer(0,0,0);
      chair = new Chair(0,0,0);
    }
    void display(){
      pushMatrix();
      translate(position.x, position.y, position.z);
      //Put Computer on top of table
      pushMatrix();
        translate(0,-table.tableHeight/2-computer.keyBoardThickness,0);
        computer.display();
      popMatrix();
      pushMatrix();
        translate(0,0,table.tableDepth/2);
        chair.display();
      popMatrix();
      table.display();
      popMatrix();
    }
}
