Lissajous myCourve;

void setup(){
	size(620, 400);
	myCourve = new Lissajous();
}

void draw(){
	background(255);
	myCourve.draw();
}