int amCount = 20;
int amSize = 40;

Amoebe [] myAmoebe = new Amoebe[amCount];

void setup () {
smooth(4);
size(displayWidth , displayHeight, P3D);
noStroke();
for (int i = 0; i < amCount; i++){
myAmoebe[i] = new Amoebe(amSize);
}

}

void draw(){
background(40);

camera(mouseX*2, mouseY*2, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);

for (int i = 0; i < amCount; i++){
myAmoebe[i].move();

for(int j = 0; j < myAmoebe.length; j++) {
if(i != j) {
if(myAmoebe[i].location.dist(myAmoebe[j].location) < 10000) {

stroke(255,20);
line(myAmoebe[i].location.x,myAmoebe[i].location.y,myAmoebe[i].location.z, myAmoebe[j].location.x, myAmoebe[j].location.y,myAmoebe[j].location.z);
}

}
}

for(int j = 0; j < myAmoebe.length; j++) {
if(i != j) {
if(myAmoebe[i].location.dist(myAmoebe[j].location) < 30 ) {

myAmoebe[i].direction.y *= -1;
myAmoebe[j].direction.y *= -1;
myAmoebe[i].direction.x *= -1;
myAmoebe[j].direction.x *= -1;
myAmoebe[i].direction.z *= -1;
myAmoebe[j].direction.z *= -1;

}

}
}

};

translate(width/2,height/2,height/2);
noFill();
stroke(255);
box(width,height,height);

}

class Amoebe {
//Position jetzt mit PVector
PVector location;

int detail = 10;
float sphereSize = 30;
float c1,c2,c3,c4,c5,c6;

// Richtung jetzt auch mit PVector, als Richtungsvector
PVector direction;

int mySize; //groesse
float speed = 8; //wird später mit dem Richtungsvektor multipliziert
float rotation = 0; //ändert sich wenn der Rand berührt wird
float rotationDelta = 0; //die Stärke, in welcher die Rotation verändert wird

Amoebe(int size) {
mySize = size; //Groessenvariable setzen
location = new PVector(random(width), random(100), random(height)); //Position wird zufällig gesetzt

//der Richtungsvektor
direction = new PVector(random(-0.5,0.5),random(2),random(2));
direction.normalize(); //damit wird der Vektor auf die Länge 1 gebracht
direction.mult(speed); // wenn Richtung nur 1 Lang ist (1 x 1 = 1) wird in jedem durchlauf nur 1px verändert, also multiply mit Speed

}

//Mover
void move() {
update();
display();
}

void update() {

location.add(direction); // nun wird die Richtung x speed addiert, die Position verändert sich

if(location.x = width) {
direction.x *= -1; //Richtungsänderung bei Randberührung
rotationDelta = random(-2, 2); //neue Rotationsgeschwindigkeit

c1 = random(256);
c2 = random(256);
c3 = random(256);
c4 = random(256);
c5 = random(256);
c6 = random(256);
}
if(location.y = height) {
direction.y *= -1; //Richtungsänderung bei Randberührung
rotationDelta = random(-2, 2); //neue Rotationsgeschwindigkeit

c1 = random(256);
c2 = random(256);
c3 = random(256);
c4 = random(256);
c5 = random(256);
c6 = random(256);

}

if(location.z = height) {
direction.z *= -1; //Richtungsänderung bei Randberührung
rotationDelta = random(-2, 2); //neue Rotationsgeschwindigkeit

c1 = random(256);
c2 = random(256);
c3 = random(256);
c4 = random(256);
c5 = random(256);
c6 = random(256);

}

rotation += rotationDelta; //Rotationsgeschwindigkeit addieren
}

void display() {
//jeweils die Matrix pushen (neue Ebene quasi, wie in Photoshop)
pushMatrix();
translate(location.x, location.y, location.z);
rotate(radians(rotation));
noFill();
stroke(c4,c5,c6);
sphereDetail(detail);
sphere(sphereSize); //Körper

fill(c1,c2,c3);
box(20,20,20);
popMatrix(); //Ende der Matrix / (PhotoshopLayer)

}

}