int numPongs = 4;
kugel[] kugel = new kugel[numPongs];
fan myfan;

void setup () {

 size (600, 400);
frameRate(10);

  for (int i = 0; i < numPongs; i++) {

    kugel[i] = new kugel(random(40,60));

  }

}

void draw () {
  background (0,0,0,100);

/// Fan anlegen
fill(0);
rect(0, 0, width, height);
myfan = new fan(300, 370); 

  for (int i = 0; i < numPongs; i++) {
    myfan.check(kugel[i].location);

    kugel[i].display();
    kugel[i].move(myfan.gegenwind);
    kugel[i].mousePressed();

    myfan.display();

  }

}

class fan{

  PVector Position;
  int size = 100;
  int high = 30;

  boolean  gegenwind = false;   /// Erkenne, ob der Ball sich über dem fan befindet

 fan(int xPos, int yPos){

   Position = new PVector(xPos, yPos);
   fill(255, 30, 70);
   stroke(10);

 } 

void display(){

rect(Position.x, Position.y, size, high);

//// ANimieren vom Wind muss ich noch einbauen

}  

void check(PVector check){

  check = new PVector(check.x, check.y);

  if(check.x >= Position.x & check.x < Position.x+size ){

    gegenwind = true ;

  } else{ gegenwind = false; }

}
}

class kugel {

  float diameter;
  PVector location;
  PVector gravity;
  PVector speed;

  PVector wind; /// Wenn der Ball über dem Fan ist soll Wind auf ihn einwirken

 kugel (float mySize) {
   diameter = mySize;
   location = new PVector (random(width/2), random(height));
   gravity = new PVector (0,0.2);
   speed = new PVector (random(2,8),random(2,8));

 }

 void move(boolean fan) {
   speed.add(gravity);
   location.add(speed);

   // Abprallen 
   if ((location.x >= width) || (location.x <= 0)) {
   speed.x = speed.x * -0.5;
   location.x = location.x - diameter/2;
   }

   if (location.y <= 0 || location.y >= height) {
     speed.y = speed.y * (-0.95 + (diameter/300)); 
     location.y = height;
   }

   if (location.y >= height - 30) {
     speed.x = speed.x - 0.99 * random(-1,1);

   }

   if ((fan == true) & (location.y < width/2)){    /// Ball ist über dem fan und der Ball ist nicht zu hoch 

      PVector wind = new PVector( 0.9, 0);

      location.y = location.y * wind.x ;

      // Zufälliger Abtrieb zur Seite, damit der Ball nicht über dem Fan verweilt und schwebt

      location.x = location.x + 10 * random(-1,1);
      println(location.y);

   } 

   }

  void mousePressed() {

  }

  void display() {

   PVector mouse = new PVector (mouseX, mouseY);

   fill(144, 206, 242, diameter);
   ellipse (location.x, location.y, diameter, diameter);
   noStroke();
  }
}