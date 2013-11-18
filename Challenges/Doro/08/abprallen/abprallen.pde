vieh dasvieh1 = new vieh();
vieh dasvieh2 = new vieh();

PVector vieh1Pos;
PVector vieh2Pos = new PVector(-100, -100);
PVector abstand;

void setup(){
size(450,450);

dasvieh1.display(100, 100);
}

void draw(){
background(255);
fill(0);

dasvieh1.move();
dasvieh2.display(vieh2Pos.x, vieh2Pos.y); 
dasvieh1.check(vieh2Pos);

}

void mousePressed(){

  vieh2Pos = new PVector(mouseX, mouseY);

}

class vieh{

  PVector Position;
  int size = 100;
  int richtung = 1;

vieh(){

}
void display(float x, float y){

   Position = new PVector(x,y);
  fill(255,0,0);
  ellipse( Position.x, Position.y, size, size);

}  

void move(){

  PVector move = new PVector(0.2,1);
  Position.x = Position.x + 0.1 * richtung;
  ellipse( Position.x, Position.y, 100, 100);
}

  void check(PVector stranger){

    float check = Position.dist(stranger);
   if( check < 1+size){   /// Das Problem : Stillstand,  weil richtung ständig negativ und positiv wird

     println("Hau ab da!");
     richtung = richtung *-1;

   }

  }

}