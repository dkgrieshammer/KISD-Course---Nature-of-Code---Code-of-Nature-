Lines myLines;

void setup() {
  size(400,400);
  smooth();
  background(250);
  myLines = new Lines();

}
void draw() {
myLines.draw();

}

////////+++++++++++++++++++++++++++++++++++++++++++

class Lines {

 void draw() {
  PVector mouseLocation = new PVector(mouseX,mouseY);  //mouse direction
  PVector centerPoint = new PVector(width/2,height/2); //center direction

  mouseLocation.sub(centerPoint);  //from center to mouse
  mouseLocation.normalize();

//mouseLocation.mult(-random(100,200));  //location of the lines
   mouseLocation.mult(width/4);               //location of the lines
   translate(width/2,height/2);           //locate center of the drawing in the middle of the canvas

  stroke(0);
  strokeWeight(0.1);
  line(-mouseLocation.x/2,-mouseLocation.y/2,mouseLocation.x,mouseLocation.y); //line lenght
  }

}