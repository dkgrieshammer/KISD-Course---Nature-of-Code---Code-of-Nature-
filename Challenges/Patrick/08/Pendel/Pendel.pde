Bob b1;
Bob b2;

Spring s1;

ArrayList plist = new ArrayList();
int MAX = 50;

void setup() {
  size(800, 600, P2D);
  background(100);
  // Create objects at starting location
  // Note third argument in Spring constructor is "rest length"
  b1 = new Bob(width/2, 100);
  b2 = new Bob(width/2, 200);

  s1 = new Spring(b1,b2,100);

}

void draw() {
  background(50);

  s1.update();
  s1.display();

  b1.update();
  b1.display();
  b2.update();
  b2.display();

  b1.drag(mouseX, mouseY);

  if(mousePressed && mouseButton == RIGHT) {
    background(50);
    boolean clearall = true;
    while(plist.size() > 0) {
      for(int i = 0; i < plist.size(); i++) {
        plist.remove(i);
      }
    }
  }

  for(int i = 0; i < plist.size(); i++) {
    Particle p = (Particle) plist.get(i);
    //makes p a particle equivalent to ith particle in ArrayList
    p.run();
    p.update();
    p.gravity();
  }
}

void mousePressed() {

 b1.clicked(mouseX, mouseY);  
}

void mouseReleased() {
  b1.stopDragging();
}

class Bob {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass = 12;

  // Arbitrary damping to simulate friction / drag
  float damping = 0.95;

  // For mouse interaction
  PVector dragOffset;
  boolean dragging = false;

  // Constructor
  Bob(float x, float y) {
    location = new PVector(x,y);
    velocity = new PVector();
    acceleration = new PVector();
    dragOffset = new PVector();

  }

  // Standard Euler integration
  void update() {
    velocity.add(acceleration);
    velocity.mult(damping);
    location.add(velocity);
    acceleration.mult(0);
  }

  // Newton's law: F = M * A
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }

  // Draw the bob
  void display() {
    stroke(0);
    strokeWeight(2);
    fill(200);
    if (dragging) {
      fill(50);
    }
    ellipse(location.x,location.y,mass*2,mass*2);
  }

  // The methods below are for mouse interaction

  // This checks to see if we clicked on the mover
  void clicked(int mx, int my) {
    float d = dist(mx,my,location.x,location.y);
    if (d < mass) {
      dragging = true;
      dragOffset.x = location.x-mx;
      dragOffset.y = location.y-my;
    }
  }

  void stopDragging() {
    dragging = false;
  }

  void drag(int mx, int my) {
    if (dragging) {
      location.x = mx + dragOffset.x;
      location.y = my + dragOffset.y;
    }
  }
}

class Spring {

  // Location
  PVector anchor;

  // Rest length and spring constant
  float len;
  float k = 0.2;

  Bob a;
  Bob b;

  // Constructor
  Spring(Bob a_, Bob b_, int l) {
    a = a_;
    b = b_;
    len = l;
  }

  // Calculate spring force
  void update() {
    // Vector pointing from anchor to bob location
    PVector force = PVector.sub(a.location, b.location);
    // What is distance
    float d = force.mag();
    // Stretch is difference between current distance and rest length
    float stretch = d - len;

    // Calculate force according to Hooke's Law
    // F = k * stretch
    force.normalize();
    force.mult(-1 * k * stretch);
    a.applyForce(force);
    force.mult(-1);
    b.applyForce(force);

    if (d > 200) {
    plist.add(new Particle(mouseX,mouseY)); // fill ArrayList with particles

    if(plist.size() > 5*MAX) {
      plist.remove(0);
    }
    }

  }

  void display() {
    strokeWeight(2);
    stroke(0);
    line(a.location.x, a.location.y, b.location.x, b.location.y);
  }
}

class Particle {
  float r = 2;
  PVector pos,speed,grav;
  ArrayList tail;
  float splash = 5;
  int margin = 2;
  int taillength = 25;

  Particle(float tempx, float tempy) {
    float startx = tempx + random(-splash,splash);
    float starty = tempy + random(-splash,splash);
    startx = constrain(startx,0,width);
    starty = constrain(starty,0,height);
    float xspeed = random(-3,3);
    float yspeed = random(-3,3);

    pos = new PVector(startx,starty);
    speed = new PVector(xspeed,yspeed);
    grav = new PVector(0,0.02);

    tail = new ArrayList();
  }

  void run() {
    pos.add(speed);

    tail.add(new PVector(pos.x,pos.y,0));
    if(tail.size() > taillength) {
      tail.remove(0);
    }

    float damping = random(-0.5,-0.6);
    if(pos.x > width - margin || pos.x < margin) {
      speed.x *= damping;
    }
    if(pos.y > height -margin) {
      speed.y *= damping;
    }
  }

  void gravity() {
    speed.add(grav);
  }

  void update() {
    for (int i = 0; i < tail.size(); i++) {
      PVector tempv = (PVector)tail.get(i);
      noStroke();
      fill(6*i + 50);
      ellipse(tempv.x,tempv.y,r,r);
    }
  }

}
