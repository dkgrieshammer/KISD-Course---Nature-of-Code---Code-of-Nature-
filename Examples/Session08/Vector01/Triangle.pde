class Triangle {

	PVector location;
	PVector velocity;

	int mySize = 10;
	float rot;

	//constructor
	Triangle (int xPos, int yPos) {
		location = new PVector(xPos, yPos);

	}

	//public function
	void draw() {
		update();
		display();
	}



/* private functions
----------------------------------------------------------------------------- */

	void update() {
		PVector mousePos = new PVector(mouseX, mouseY);
		PVector direction = PVector.sub(mousePos, location);
		//calculate angle
		rot = direction.heading();
		println(rot);
	}

	void display() {
		pushMatrix();
		translate(location.x, location.y);
		rotate(rot + PI/2);
		triangle(0, 0, mySize, 2*mySize, -mySize, 2*mySize);
		popMatrix();
	}

}