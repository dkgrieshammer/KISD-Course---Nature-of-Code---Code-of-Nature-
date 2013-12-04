void setup(){
	size(600, 450);

}

void draw(){
	background(255);

	pushMatrix();
	translate(width/2, height/2);

	PVector mV = new PVector(mouseX - width/2, mouseY - height/2);
	line(0, 0, mV.x, mV.y);
	
	PVector test = new PVector(1, 10);
	test.normalize();

	float tX = mV.x * test.x;
	float tY = mV.y * test.y;
	// test = test.dot(mV);

	stroke(255, 0, 0);
	line(0, 0, tX, tY);


	String writeText = "tX is: " + str(tX) + " tY is: " + str(tY);
	String mVCoords = "x: " + mV.x + " y: " + mV.y;
	fill(50);
	// println("var: "+writeText);
	text(writeText, 20, 20);
	text("dotProduct is " + str(tX + tY), 20, 40);
	text(mVCoords, mV.x - 20, mV.y + 20);
	popMatrix();
}