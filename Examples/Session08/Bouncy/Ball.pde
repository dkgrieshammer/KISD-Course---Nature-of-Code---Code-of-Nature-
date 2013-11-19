class Ball {

	PVector location;
	PVector velocity = new PVector(random(-2, 2), random(-2, 2));

	float mySize; //grösse
	int id; // die Bälle brauchen nun eine ID für die collision-detection!

	//constructor
	Ball(int getID) {

		location = new PVector(random(width), random(height));
		mySize = 20 + random(20); //irgendwas zw. 20 u. 40
		id = getID; //eindeutige ID für die Collision-detection
	}

	//public function (wird von aussen aufgerufen, der Rest wird intern abgefeiert)
	void draw() {
		update();
		display();
	}



	// ++++++++++++++++++++++++++++++++++++++++++++++++++
	//private Funktionen die nur intern aufgerufen werden
	// ++++++++++++++++++++++++++++++++++++++++++++++++++

	void update() {
		location.add(velocity);
		collisionDetection();
		checkEdges();
	}

	//check if collides
	void collisionDetection() {
		for(int i = 0; i < bouncies.length; i++) {
			//Sicherstellen, dass die IDs nicht identisch sind, um nicht mit sich selbst zu reagieren
			if(bouncies[i].id != id) {

				PVector distanceVector = PVector.sub(location, bouncies[i].location); //Vector von diesem zum nächsten 
				float myLength = distanceVector.mag();
				//if colliding
				if(myLength <= mySize/2 + bouncies[i].mySize/2) {
					// what now?
				}
			}
		}
	}

	//check if edges are met
	void checkEdges() {
		if(location.x >= width - mySize/2 || location.x <= mySize/2) {
			velocity.x *= - 0.99;
		}

		if(location.y >= height - mySize/2) {
			location.y = height - mySize/2;
			velocity.y *= -0.99;
		}
		if(location.y <= mySize/2) {
			location.y = mySize/2;
			velocity.y *= -0.99;
		}
	}

	void display() {
		ellipse(location.x, location.y, mySize, mySize);
	}

}