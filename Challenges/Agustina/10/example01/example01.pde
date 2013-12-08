// Double Pendulum
// Aus dem Exempel NOC_3_10_PendulumExampleSimplified 
//
// Examples/Books/Nature of Code/chp3_oscillation/NOC_3_10_PendulumExampleSimplified


Pendulum doubleP;

void setup() {
  size(300,300);
  smooth(6);
  background(255);

 
  doubleP = new Pendulum();

}

void draw() {
  doubleP.go();
}

void mouseClicked(){
  background(255);
}



///////
///////
///////


class Pendulum {

PVector p1;                   // Location of arm origin
PVector p2; 
float r1 = 70;                // Length of arm
float r2 = 70;                
float angle1 = PI;            // Pendulum arm angle1
float angle2 = PI + 0.001;    
float aVelocity1;             // Angle velocity
float aVelocity2;                        
float aAcceleration1;         // Angle acceleration
float aAcceleration2;     
float ballr1 = 10;            // Ball radius
float ballr2 = 10;             
float damping = 0.999;        // Arbitary damping amount



 
  Pendulum() {
    p1 = new PVector();
    p2 = new PVector();

  }
  
    void go() {
    update();
    display();  
  }
  
   void update() {
    float gravity = 0.4;                              // Arbitrary constant
     
                                                      // http://scienceworld.wolfram.com/physics/DoublePendulum.html 
    aAcceleration1 = (-gravity * (2 * ballr1 + ballr2) * sin(angle1) - ballr2 * gravity * sin(angle1 - 2 * angle2) - 2 * sin(angle1 - angle2) * ballr2 * (aVelocity2 * aVelocity2 * r2 + aVelocity1 * aVelocity1 * r1 * cos(angle1 - angle2))) / (r1 * (2 * ballr1 + ballr2 - ballr2 * cos(2 * angle1 - 2 * angle2)));
    aAcceleration2 = (2 * sin(angle1 - angle2) * (aVelocity1 * aVelocity1 * r1 * (ballr1 + ballr2) + gravity * (ballr1 + ballr2) * cos(angle1) + aVelocity2 * aVelocity2 * r2 * ballr2 * cos(angle1 - angle2))) / (r2 * (2 * ballr1 + ballr2 - ballr2 * cos(2 * angle1 - 2 * angle2)));
   
    aVelocity1 += aAcceleration1;                     // Increment velocity
    aVelocity1 *= damping;                            // Arbitrary damping
    aVelocity2 += aAcceleration2;                     // Increment velocity
    aVelocity2 *= damping;                            // Arbitrary damping
  
    angle1 += aVelocity1;
    angle2 += aVelocity2;
  }
  

  void display() {
    p1.set(r1*sin(angle1), r1*cos(angle1), 0);       // Polar to cartesian conversion
    p2.set(p1);
    p2.add(r2*sin(angle2), r2*cos(angle2), 0);
    
    stroke(0);
    strokeWeight(0.3);

    translate(width / 2, height / 2);               // Draw the arm
    line(0, 0, p1.x, p1.y);
    line(p1.x, p1.y, p2.x, p2.y);
                      
    fill(255);                                      // Draw the ball
    ellipse(p1.x, p1.y, 10, 10);
    ellipse(p2.x, p2.y, 10, 10);
      

  }
  

  }