String [] n = {
	"Internet:",
	"Fachzeitschriften:",
	"Freunde/Familie:",
	"Lehrer:",
	"Vorträge/Projekte an der KISD:",
	"Vortrag an Berufsschulen:"
};

// Add value
int[] people = {
60 ,
2 ,
52 ,
12 ,
4 ,
28 ,
4
};

void setup(){
size(400,250);
String s = "Woher kennst du die KISD?";
fill (0);
text (s, 10 , 30);
textSize (25);
}

void draw(){
int x=0;
for(int i=0;i<7;i++){ if(mouseX>x && mouseX<=x+40){ // Gesamtebreite des Balkens
fill(200,120,40);
// text(String n, 10, 10);
}
else{
fill(50); // graue Balken
}
//Daten in den Rahmen einpassen, hier nicht nötig, aber hilfreiche Funktion bei großen Datensätzen
float h = map(people[i]*3,0,width,0,400);

//Position und Größe der Balken
rect(x+10,height-h-10,32,h);
// x-Position, damit nebeneinander
x+=40;
}

}