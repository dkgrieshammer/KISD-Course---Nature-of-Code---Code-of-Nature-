int numBalls = 1;
Ball [] balls = new Ball [numBalls];

void setup () {
    size (600, 400);
    background(50, 50, 50);
    noStroke();

    for (int i = 0; i < numBalls; i++) {
        balls[i] = new Ball(random(10, 25));

    }
}

void draw () {
    for (int i = 0; i < numBalls; i++) {
        balls[i].move();
        balls[i].mousePressed();
        balls[i].display();
    }
}

class Ball {

    float diameter;
    PVector location;
    PVector velocity;
    PVector gravity;

    Ball (float mySize) {
        diameter = mySize;
        location = new PVector (random(width), random(height));
        gravity = new PVector (0, 0.3);
        velocity = new PVector (random(1, 5), random(1, 5));
    }

    void move () { // Funktion einführen
        velocity.add (gravity);
        location.add (velocity);

        if ((location.x > width) || (location.x < 0)) {
            velocity.x = velocity.x * -1;
        }

        if (location.y > height) {
            velocity.y = velocity.y * (-0.99 + (diameter / 150));
            location.y = height;
        }
        
        if(location.y > height - 30) {
        	velocity.x = velocity.x * 0.99;
        }
    }

    void mousePressed () {
        if (mousePressed) {
            location = new PVector (random(width), random(height));
        }
    }

    void display () {
        fill (200, 90, 105, diameter);
        ellipse (location.x, location.y, random(diameter), diameter);
        noStroke ();
    }

}