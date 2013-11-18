
Kugel myKugel;

//ein generisches Grafik-Objekt, in das ein Bild gezeichnet wird, um dessen Farbe an der Ball-Position zu checken.
PGraphics pg;

void setup(){
  size(640, 480);
  frameRate(30);

  pg = createGraphics(640, 480); //das leere Grafik-Objekt in Bildschirmgrösse erstellen, man könnte auch einfach ein Bild nehmen

  PVector V2 = new PVector(129,128);
  myKugel = new Kugel(V2); //Wenn du mit V2 sonst nichts mehr machen willst könnte man den auch on-the-fly erstellen und gleich übergeben: myKugel = new Kugel(new PVector(129, 128));

}

void draw(){

    generiereBild();
     
    myKugel.move();
    
    //Ich habe ein paar Kommentare zu der Funktion in die Klasse geschrieben. Im Prinzip kann man einfach an der Kugel-Position die Farbe des Bilds abfragen 
    myKugel.background_color_check(); 
}

//funktion die ein Bild in das Grafik-Objekt zeichnet und das dann als Bild umwandelt und auf die Bühne bringt.
void generiereBild() {

  pg.beginDraw();
  pg.background(0);
  pg.fill(255);
  pg.rect(300, 300, 60, 60);
  pg.fill(255, 0, 0);
  pg.rect(200, 200, 60, 60);
  pg.endDraw();

  image(pg, 0, 0); //hier wird aus dem Grafik-Objekt ein Bild gerendert (als ob aus Illustrator ein png exportiert wird)
}