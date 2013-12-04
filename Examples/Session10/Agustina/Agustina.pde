  Circle c1, c2;

void setup() {
  size(500,340);
  smooth();
  c1 = new Circle(new PVector(random(5),random(-5,5)),new PVector(10,10));
  c2 = new Circle(new PVector(-2,1),new PVector(150,150));
}

void draw() {  
  background(0);
  c1.draw();
  c2.draw();  

  c1.collisionCicle(c2);
}

//////
//////
//////

class Circle {

  PVector position;
  PVector velocity;
  float bounce = 1.0;
  float r = random(10,60);
  boolean colliding = false;

  Circle(PVector v, PVector p) {
    velocity = v.get();
    position = p.get();
  }

////////////////////////////////////////////////////

  void draw() {
    update();
    checkEdges();
    display();
  }

////////////////////////////////////////////////////

  void update() {
    position.add(velocity);
  }

////////////////////////////////////////////////////

  void display() {
    ellipseMode(CENTER);
    noStroke();
    fill(200,200);
    ellipse(position.x,position.y,r*2,r*2);
  }

//////////////////////////////////////////////////// 

  void collisionCicle(Circle other) {
    float d = PVector.dist(position,other.position);
    float sumR = r + other.r;
    if (!colliding && d < sumR) {                             //if circles are colliding
      colliding = true;
      PVector n = PVector.sub(other.position,position);       // change direction
      n.normalize();

      PVector u = PVector.sub(velocity,other.velocity);       //change velocity

      PVector un = componentVector(u,n);                      // Separate out components -- one in direction of normal
      u.sub(un);                                              // Other component

      velocity = PVector.add(u,other.velocity);               // circleVelocity + otherCircleVelocity
      other.velocity = PVector.add(un,other.velocity);
    } 
    else if (d > sumR) {
      colliding = false;
    }
  }

//////////////////////////////////////////////////// 

  void checkEdges() {
    if (position.y > height-r) {
      position.y = height-r;
      velocity.y *= -bounce;
    } 
    else if (position.y < r) {
      position.y = r;
      velocity.y *= -bounce;
    } 
    if (position.x > width-r) {
      position.x = width-r;
      velocity.x *= -bounce;
    }  
    else if (position.x < r) {
      position.x = r;
      velocity.x *= -bounce;
    }
  }  

}

////////////////////////////////////////////////////
////////////////////////////////////////////////////

PVector componentVector (PVector vector, PVector directionVector) {
  //--! ARGUMENTS: vector, directionVector (2D vectors)
  //--! RETURNS: the component vector of vector in the direction directionVector
  //-- normalize directionVector
  directionVector.normalize();
  directionVector.mult(vector.dot(directionVector));
  return directionVector;
}