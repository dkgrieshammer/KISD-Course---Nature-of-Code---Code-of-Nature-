Attractor [] attractors = new Attractor[2];
Mover [] movers = new Mover[500];

void setup() {
  size(600, 300);
  smooth();
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1, 2), random(width), random(height));
  }

  for (int i = 0; i < attractors.length; i++) {
    attractors[i] = new Attractor(random(40,width-40), random(40,height-40), random(20, 40));
  }
}

void draw() {
  fill(255, 100);
  rect(0, 0, width, height);

  for (int i = 0; i < movers.length; i++) {
    for ( int j = 0; j < attractors.length; j++) {
      PVector force = attractors[j].attract(movers[i]);
      movers[i].applyForce(force);
    }

    //++apply the attraction force from the attractor on the mover
    movers[i].update();
    movers[i].display();
  }

}

///////////////////++++++++++++++++++++++++

class Attractor {
  float mass;
  PVector position;
  float G;

  Attractor(float x, float y, float mass_) {
    position = new PVector (x, y);
    mass = mass_;
    G = 0.4;
  }

  PVector attract(Mover m) {

    PVector force = PVector.sub(position, m.position);    //force direction
    float distance = force.mag();
    distance = constrain(distance, 5, 25);               //constraint distance
    force.normalize();
    float strength = (G*mass*m.mass) / (distance * distance);
    force.mult(strength);                                // force magnitude
    return force;   
  }

  void display() {
    ellipse(position.x, position.y, mass*2, mass*2);
  }
}

class Mover {

  PVector position;
  PVector speed;
  PVector acceleration;
  float mass;

  Mover(float m, float x, float y) {
    mass = m;
    position = new PVector(x, y);
    speed = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  // ++ A = F / M
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {

    speed.add(acceleration);    // velocity changes according to acceleration
    position.add(speed);        // position changes by speed
    acceleration.mult(0);       // clear acceleration each frame

  }

  void display() {
    noStroke();
    fill(0);
    ellipse(position.x, position.y, mass, mass);
  }

  // Bounce off bottom of window
  void checkEdges() {

    if (position.x > width) {
      speed.x *= -0.9;                  // change direction // speed.x = speed.x*0.95
      position.x = width;
   } else if (position.x < 0) {
      speed.x *= -0.9;                  // multiplier < 0 == friction
      position.x = 0;
    }
    if (position.y > height-15) {
      speed.y *= -0.9;  
      position.y = height-15;
    }else if (position.y < 0) {
      speed.y *= -0.9;                  // multiplier < 0 == friction
      position.y = 0;
    }

  }
}