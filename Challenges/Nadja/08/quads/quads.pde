Form myQuad;
Form myQuad2;

void setup(){

size(640, 480);
background(0);

}

void draw(){

fill(random(20), random(255), random(233), random(40, 100));
myQuad = new Form(random(300, 320), random(10, 360), random(400, 560), random(100, 240), random(80, 400), random(120, 340), random(100, 200), random(200, 400));

stroke(random(250), 50);
fill(0, 70);
myQuad2 = new Form(random(100, 520), random(10, 260), random(400, 640), random(100, 440), random(80, 400), random(120, 340), random(60, 200), random(200, 460));

noStroke();
fill(0, 80);
rect(random(40), random(370), 680, random(90));
}

class Form {

// Form(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, float x5, float y5){ //hier habe ich versucht einen quad mit fünf punkten zu erzeugen, was aber nicht funktioniert, dafür aber mit vertex
	Form(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4){

	quad(x1, y1, x2, y2, x3, y3, x4, y4);
	// quad(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5);
	}
}