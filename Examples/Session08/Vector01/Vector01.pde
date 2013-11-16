
Triangle myDreieck;

void setup(){
	size(1024, 800);
	myDreieck = new Triangle(width/2, height/2);
}

void draw(){
	background(0);
	myDreieck.draw();
}