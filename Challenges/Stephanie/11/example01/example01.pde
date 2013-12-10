ArrayList particles;

void setup() {
size(600,600);
particles = new ArrayList();
smooth();
}

void draw() {

particles.add(new Particle());

background(255);

for (int i = 0; i < particles.size(); i++ ) {
Particle p = (Particle) particles.get(i);
p.run();
p.gravity();
p.display();
}
if (particles.size() > 200) {
particles.remove(2);
}
}

class Particle {

float x;
float y;
float xspeed;
float yspeed;

Particle() {
x = mouseX;
y = mouseY;
xspeed = random(-1,1);
yspeed = random(-2,0);
}

void run() {
x = x + xspeed;
y = y + yspeed;
}

void gravity() {
yspeed += .0;
}

void display() {
stroke(0);
fill(random(200), random(20), random(200));
rect(x,y,10,10,8);
}
}