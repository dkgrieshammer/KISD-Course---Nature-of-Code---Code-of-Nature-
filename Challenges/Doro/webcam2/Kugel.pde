class Kugel{

  float xPos;
  float yPos;
  float mysize;
  float colour;
  float xSpeed = 0.8;
  float ySpeed = 0.9;
  PVector V;

  boolean schwarz= false;

  Kugel ( PVector V1){

    V1.y = V1.y + random(30);
    V = new PVector(V1.x, V1.y); 

  }

   void move(){

     // DEFINIEREN

     fill(random(200,224),random(1),random(100,133),55); 

     mysize= 33; // Du setzt hier die Size in jedem Durchlauf - einmal im Setup wäre ausreichend
     stroke(225); // Das gilt für den Stroke und smooth ebenfalls
     smooth(2);

     ellipse(V.x,V.y,mysize,mysize);

     fill(0,55);
     ellipse(V.x-5,V.y, 11,11);
     ellipse(V.x+8,V.y, 11,11);

     if (schwarz = true){
            // Was passiert hier ???
     }

     // BEWEGEBEN // ouhh Klaustrophilie

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


/*
* This function makes me head ache :) can you please write a little more descriptive ?
* Ausserdem nochmal zur Erinnerung: Klassen-Namen gross - Methoden-Namen klein ;)
*/

/**
* @name abprall_check
* @desc: check background-color if black -> sollte vielleicht colorcheck heissen ;)
* @param float r: red value from 0 to 255
* @param float g: green value from 0 to 255
* @param float b: blue value from 0 to 255
* @param float position: what is that for ?
* @param float Pixelposition: what is that for and how can a position be only one value?
* @param PVector merke: what does that do?
* @return void (means nothing is returned) 
*/
void abprall_check(float r, float g, float b, float position, float Pixelposition, PVector merke){

  PVector Kugelposition = new PVector( V.x, V.y); //leichter mit V.get()

  float d = Kugelposition.dist(merke);

  float check = r+g+b;

  if (check < 50){

    schwarz = true;
    // println("Ja, bin am schwarzen Fleck");

    } else { 

      schwarz=false;

    }
  }   


/**
* @name background_color_check
* @desc: checks color-value at postion of PVector V and prints it out
* @return void (means nothing is returned) 
*/

void background_color_check (){
  // Farbe des Grafik-Objekts pg an der Position der Kugel abfragen (mittels PImage.get(x, y) bekommt man die Farbe an der Position)
  println(pg.get(int(V.x), int(V.y)));
  }
}