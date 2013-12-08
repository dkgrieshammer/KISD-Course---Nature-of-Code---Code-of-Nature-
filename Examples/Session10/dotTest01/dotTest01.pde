void setup(){
	size(600, 450);

}

void draw(){
	background(255);

	translate(width/2, height/2); //change origin to center of window
	PVector mV = new PVector(mouseX - width/2, mouseY - height/2); //new Vector at MousePosition
	line(0, 0, mV.x, mV.y); //draw a line to mouse

	//TESTVECTOR: use it to experiment whats happening
	PVector test = new PVector(1, 10); //Play with values and see whats going on
	test.normalize(); //set to a length of 1 (otherwise its to long to see)

	// DOT PRODUCT: multipliing two vectors, thats whats PVector.dot() is doing
	float tX = mV.x * test.x; //first mult v1.x * v2.x
	float tY = mV.y * test.y; // then mult v1.y * v2.y
	float dotProduct = tX + tY; //sum of both is the dot-product

	// draw line to dot-vector
	stroke(255, 0, 0); //color red
	line(0, 0, tX, tY); //line to the calculated points of the dot-product


	// WRITING text to display
	String writeText = "tX is: " + str(tX) + " tY is: " + str(tY);
	String mVCoords = "x: " + mV.x + " y: " + mV.y;

	fill(50);
	text(writeText, 20, 20);
	text("dotProduct is " + str(tX + tY), 20, 40);
	text(mVCoords, mV.x - 20, mV.y + 20);
}