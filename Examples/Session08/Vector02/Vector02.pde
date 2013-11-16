Triangle myTriangle;

void setup(){
	size(1024, 800);
	smooth();
	myTriangle = new Triangle(width/2, height/2);
}

void draw(){
	background(0);
	myTriangle.draw();
}