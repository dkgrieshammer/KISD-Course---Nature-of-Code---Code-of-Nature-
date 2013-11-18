int nObjekt = 5;
Objekt[] meinObjekt = new Objekt[nObjekt];

void setup() {
  size(800, 400);

  for (int i = 0; i < nObjekt; i++) {
    meinObjekt[i] = new Objekt(30);
  }
}

void draw() {
  background(255);

  for (int i = 0; i < nObjekt; i++) {
  meinObjekt[i].update();
  meinObjekt[i].Mausliebe();
  meinObjekt[i].display();

  }
}

class Objekt {

  PVector location;
  PVector velocity;
  PVector acceleration;

  float angle;
  float aVelocity = 0.03;
  float aAcceleration = 0.01;
  float size;

  /* CONSTRUCTOR */

  Objekt(float mySize) {
    size = mySize;
    location = new PVector (random(100), random(400));
    acceleration = new PVector (0, 0);
    velocity = new PVector (0, 0.1);

  }

/* BEWEGUNG */

  void update() {

    velocity.add(acceleration);
    location.add(velocity);

    aAcceleration = acceleration.x / 10;
    aVelocity += aAcceleration;  //Angular equivalent of velocity.add(acceleration);
    aVelocity = constrain(aVelocity,-0.1,0.1);
    angle += aVelocity;  //Angular equivalent of location.add(velocity);
    acceleration.mult(0);

    if ((location.x >= width) || (location.x <=0)) {
      velocity.x = velocity.x * -0.1;
      acceleration.x = acceleration.x * -0.01;
    }

    if (location.y >= height) {
      velocity.y = velocity.y *(-0.05 + (size/50));
      location.y = height;
      acceleration.y = acceleration.y * -0.01;
    }
  }

  /* MAUSFUNKTION */
  /* Rechtecke rorieren um die Maus */

  void Mausliebe(){
    PVector mouse = new PVector(mouseX, mouseY);
    PVector richtung = PVector.sub(mouse, location);
    richtung.normalize();
    richtung.mult(2);
    acceleration = richtung;
  }

  void display() {

    fill(20,50,255);
    noStroke();

    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    //rectMode(CENTER);
    rect(0, 0, 50, 5);  
    popMatrix();
  }

}