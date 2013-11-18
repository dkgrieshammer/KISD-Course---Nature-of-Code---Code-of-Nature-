/**
 * Mirror 
 * by Daniel Shiffman.  
 *
 * Each pixel from the video source is drawn as a rectangle with rotation based on brightness.   
 */ 

import processing.video.*;

PVector PixelPos = new PVector(0,0);
PVector KugelPos;

boolean blackspot = false;

// Size of each cell in the grid
int cellSize = 10;
// Number of columns and rows in our system
int cols, rows;
// Variable for capture device
Capture video;

int wuerfeln = 0;
kugel kugel1;        // Eine lustige Amoebe

lupe mylupe;

void setup() {
  size(640, 480);
  frameRate(30);

  cols = width / cellSize;
  rows = height / cellSize;

  colorMode(RGB, 255, 255, 255, 100);

  // This the default video input, see the GettingStartedCapture 
  // example if it creates an error
  video = new Capture(this, width, height);

  // Start capturing the images from the camera

  mylupe = new lupe();

 PVector V2 = new PVector(129,128);
 kugel1 = new kugel(V2);

  video.start();  

  background(0);
  int versuch = rows;
}

void draw() { 

  if (video.available()) {
    video.read();
    video.loadPixels();

    // Begin loop for columns
    //cols = versuch;
    for (int i = 0; i < cols; i++) {
      // Begin loop for rows

///////////////////////////////////////////////////////////////////////////////

kugel1.move();

      for (int j = 0; j < rows; j++ ) {

        int lupenullpunktx = j;
        int lupenullpunkty = i;

         if ( lupenullpunktx < mylupe.x | lupenullpunktx > mylupe.x +10 ||  lupenullpunkty < mylupe.y | lupenullpunkty >mylupe.y+10  ) { 

       // Where are we, pixel-wise?
        int x = i*cellSize;
        int y = j*cellSize;
        int loc = (video.width - x - 1) + y*video.width; // Reversing x to mirror the image

        float r = red(video.pixels[loc]);
        float g = green(video.pixels[loc]);
        float b = blue(video.pixels[loc]);
        // Make a new color with an alpha component
        color c = color(r, g, b, 75);

        // Code for drawing a single rect
        // Using translate in order for rotation to work properly
        pushMatrix();
        translate(x+cellSize/2, y+cellSize/2);
        // Rotation formula based on brightness
        rotate((2 * PI * brightness(c) / 155.0));
        rectMode(CORNERS);
        fill(c);
        noStroke();
        // Rects are larger than the cell for some overlap
        //stroke(4, 255,44,44);

/// Zufallswürfeln entscheidet ob ein Kreis oder ein Quadrat gezeichnet wird

         wuerfeln = (int)random(1,3);       
        if (wuerfeln < 2){
          rect(0, 0, cellSize+6, cellSize+16);
        }

        else{ellipse(0, 0, cellSize+10, cellSize+40);}

//// AN allen Schwazen Pixeln TEXT einfügen

        rotate(PI/2.0);            /// Drehen für den Text

          if ( r+g+b < 100){

          blackspot = true;
          textSize(27);

          text("BLACK", cellSize, cellSize);
          PixelPos.x = x+cellSize/2; 
          PixelPos.y = x+cellSize/2;

//// Kontrolliere ob der Farbpixel, ab dem sich die Kugel grad befindet schwarz ist
//// Klappt leider nicht so gut

          kugel1.Abprallcheck(r,g,b, kugel1.yPos, cellSize, PixelPos);

        } else{ blackspot = false;}

        popMatrix();

         }                
      }    
    }
  }         
}

class kugel{

  float xPos;
  float yPos;
  float mysize;
  float colour;
  float xSpeed = 0.4;
  float ySpeed = 0.2;
  PVector V;

  boolean schwarz= false;

  kugel ( PVector V1){
    V1.y = V1.y + random(30);
    V = new PVector(V1.x, V1.y); 

  }

   void move(){

     // DEFINIEREN

     fill(random(200,224),random(1),random(100,133),55); 

     mysize= 33;
     stroke(225);
     smooth(2);
     ellipse(V.x,V.y,mysize,mysize);
     fill(0,55);
     ellipse(V.x-5,V.y, 11,11);
     ellipse(V.x+8,V.y, 11,11);

     if (schwarz = true){

     }

     // BEWEGEBEN

     V.x = V.x + xSpeed;
     V.y = V.y + ySpeed;

     // RICHTUNG ÄNDRERN

      if (V.x > 640) {
        xSpeed = xSpeed * -1.93;
        ySpeed = ySpeed * -random(1.66);

       }
       if (V.y > 480) {
        xSpeed = xSpeed * -random(-1,1.93);
        ySpeed = ySpeed * -1.66;

       }
       if (V.x < 0) {
        xSpeed = xSpeed = 1.93;
        ySpeed = ySpeed = random(1.66);

       }

       if (V.y > 640) {
        xSpeed = xSpeed * -1.93;
        ySpeed = ySpeed * -1.66;

       }
       if (V.y < 0) {
        xSpeed = xSpeed = 1.93;
        ySpeed = ySpeed = random(1.66);

       }

   }

void Abprallcheck(float r, float g, float b, float position, float Pixelposition, PVector merke){

  PVector Kugelposition = new PVector( V.x, V.y);

  float d = Kugelposition.dist(merke);

  float check = r+g+b;
 if (check < 50){
 schwarz = true;

 // println("Ja, bin am schwarzen Fleck");

  } else{ schwarz=false;

  }
}   
}

class lupe{

  int x = mouseX;
  int y = mouseY;

  lupe(){   

    ellipse(mouseX, mouseY, 20,20);

  }

  void sichtbar(){

    //rect(mouseX, mouseY,100,100);

  }

}