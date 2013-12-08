Bouncies[] myBouncies = new Bouncies[20];
Segment[] mySegment = new Segment[1];
PImage photo;

void setup() {
  size(640, 360);
  smooth();
  // photo = loadImage("modern_times_11.jpg");

  //Array für Segmentkette
  for (int i = 0; i<1; i++) {
    mySegment[i] = new Segment();
  }

  // Array für die Bouncies
  for (int i = 0; i<20; i++) {
    myBouncies[i] = new Bouncies(50);
  }
}

void draw() {
  // das Foto wird reingeladen
  // image(photo, 0, 0); 
  background(255);

  //Array für die Segmentkette
  for (int i = 0; i < 1; i++) {
    // mySegment[i].dragSegment(i, float(4), float(0));
    mySegment[i].maus();
    // mySegment[i].display();
  }
  //Array für die Bouncies
  for (int i = 0; i < 20; i++) {
    myBouncies[i].move();  }
}

class Segment {

  float[] x = new float[4];
  float[] y = new float[4];
  float segLength = 80;

  /////* BEWEGUNG */////

  void dragSegment(int i, float xin, float yin) {
    float dx = xin - x[i];
    float dy = yin - y[i];
    float angle = atan2(dy, dx);  
    x[i] = xin - cos(angle) * segLength;
    y[i] = yin - sin(angle) * segLength;

    // segment(x[i], y[i], angle);
    display(x[i], y[i], angle);
  }

  /////* Mausfunktion */////

  void maus() {
    dragSegment(0, mouseX, mouseY);
    for (int i=0; i<x.length-1; i++) {
      dragSegment(i+1, x[i], y[i]);
    }
  }

    /////* SEGMENTFORM */////

    void display(float x, float y, float a) {
      pushMatrix();
      strokeWeight(50);
      stroke (200, 120, 80, 200);
      translate(x, y);
      rotate(a);
      line(0, 0, segLength, 0);
      popMatrix();
    }
  }

class Bouncies {

  PVector location; //Ort
  PVector acceleration; //Beschleunigung
  PVector gravity; //Schwerkraft
  PVector speed; //Geschwindigkeit
  float SizeKreis; //Kreisgröße

/////* CONSTRUCTOR */////

  Bouncies(float size) {
    SizeKreis = size;
    location = new PVector (180, 200);
    acceleration = new PVector (0, 0);
    gravity = new PVector (0, 0.2);
    speed = new PVector (random(-1, 1), random(-1, 1));
  }

/////* BOUNCIES BEWEGUNG UND AUSSEHEN */////

  void move() {

    location.add(speed);
    speed.add(acceleration);
    speed.add(gravity);

    ellipse(location.x, location.y, SizeKreis, SizeKreis);
    noStroke();
    fill(20, 200, 150, 100);

//Abprallen an den Wänden
    if ((location.x >= width) || (location.x <=0)) {
      speed.x = speed.x * -1;
      acceleration.x = acceleration.x * -0.01;
    }

    if (location.y >= height) {
      speed.y = speed.y *(-1.4 + (SizeKreis/120));
      location.y = height;
      acceleration.y = acceleration.y * -0.01;
    }
  }
}