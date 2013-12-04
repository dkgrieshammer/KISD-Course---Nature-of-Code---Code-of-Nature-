class Ball {

	PVector location;
	PVector velocity = new PVector(random(-2, 2), random(-2, 2));

	float mySize; //grösse
	int id; // die Bälle brauchen nun eine ID für die collision-detection!
	boolean colliding = false;

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
		collisionDetection();
		location.add(velocity);
		checkEdges();
	}

	//check if collides
	void collisionDetection() {
		for(int i = 0; i < bouncies.length; i++) {
			//Sicherstellen, dass die IDs nicht identisch sind, um nicht mit sich selbst zu reagieren
			if(bouncies[i].id != id) {

				PVector distanceVector = PVector.sub(location, bouncies[i].location); //Vector von diesem zum nächsten 
				float myDistance = distanceVector.mag();
				float minDist = mySize/2 + bouncies[i].mySize/2; // min distance between both bouncies

				//if colliding
				if(!colliding && myDistance < minDist) {
					
					//prevent overlapping
					float overlappingDistance = minDist - myDistance; //how much do the balls overlap
					PVector overlapV = distanceVector.get(); //copy the distance Vector
					overlapV.normalize(); //normalize to 1
					overlapV.mult(overlappingDistance); // set to length of overlapping
					location.add(overlapV); // and add it to this location

					// colliding = true;

					println("bump" + id);

					//The core of the Pudel
					PVector between = distanceVector.get();
					between.normalize();
					// println(between);

					PVector velocityBetween = PVector.sub(velocity,bouncies[i].velocity);

					PVector componentV = componentVector(velocityBetween, between);
					velocityBetween.sub(componentV);

					velocity = PVector.add(velocityBetween, bouncies[i].velocity);
					bouncies[i].velocity = PVector.add(componentV, bouncies[i].velocity);
					//To get the angle between 
					// float theta = acos(fV.dot(sV) / (fV.mag() * sV.mag()));

					//Pudel END
				} else if (myDistance > (mySize/2 + bouncies[i].mySize/2)) {
					colliding = false;
				}
			}
		}
	}

	PVector componentVector (PVector velocityVector, PVector directionVector) {
	  //--! ARGUMENTS: velocityVector, directionVector (2D vectors)
	  //--! RETURNS: the component vector of vector in the direction directionVector
	  //-- normalize directionVector
	  directionVector.normalize();
	  println(velocityVector.dot(directionVector));

	  directionVector.mult(  velocityVector.dot(directionVector)  );

	  return directionVector;
	}

	//check if edges are met
	void checkEdges() {
		if(location.x > width - mySize/2) {
			location.x = width - mySize/2;
			velocity.x *= - 0.9;
		}

		if(location.x < mySize/2) {
			location.x = mySize/2;
			velocity.x *= - 0.9;
		}

		if(location.y >= height - mySize/2) {
			location.y = height - mySize/2;
			velocity.y *= -0.9;
		}
		if(location.y <= mySize/2) {
			location.y = mySize/2;
			velocity.y *= -0.9;
		}
	}

	void display() {
		ellipse(location.x, location.y, mySize, mySize);
	}

}