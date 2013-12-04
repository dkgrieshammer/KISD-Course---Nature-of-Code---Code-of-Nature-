PVector test;

void setup(){
	size(620, 400);
	test = new PVector(0,0);
}

void draw(){
	background(255);
	translate(width/2, height/2);
	PVector fV = new PVector(50,0);
	PVector sV = new PVector(mouseX - width/2, mouseY - height/2);
	sV.normalize();
	sV.mult(50);


	stroke(255, 0,0);
	line(0, 0, fV.x, fV.y);

	stroke(40);
	line(0,0,sV.x, sV.y);

	float d = fV.dot(sV);
	//check out http://natureofcode.com/book/chapter-6-autonomous-agents/ for Dot-Product
	//we're basically calculating the angle between those two vectors
	
	float p = PVector.angleBetween(sV, fV);
	// float theta = acos(fV.dot(sV) / (fV.mag() * sV.mag()));
	// drawText(str(d));
	drawText(str(degrees(p)));
	// drawText(str(degrees(theta)));

}

void drawText(String s) {
	pushStyle();
	fill(50);
	text(s, 20, 20);
	popStyle();
}