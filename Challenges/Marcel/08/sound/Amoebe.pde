class Amoebe {

	PVector location;
	PVector direction;

	int mySize; 
	float gewicht = 1.002;
	float gravitation = 1;
	float rotation = 0; 
	float rotationDelta = 0;

	Amoebe(int size) {
		mySize = size; 
		location = new PVector(random(width), random(0,200)); //Position wird zufällig gesetzt
		direction = new PVector(random(1), 1); 
	}

	void move() {
		update();
		display();
	}

	void update() {

		location.add(direction);

		direction.y = (direction.y+gravitation)*gewicht-input.mix.level ()*20;

		if(location.x <= 0 || location.x >= width) {
			direction.x = -1; 
			rotationDelta = random(-0.01, 0.01); 
		}

		if(location.y <= 0 || location.y >= height) {
			direction.y *= -0.6; 
			rotationDelta = random(-1, 1); 
		}

		for (int i = 0; i < tierchen.length; i++) {
			for(int j = 0; j < tierchen.length; j++) {
				if(i != j){
					if(tierchen[i].location.dist(tierchen[j].location) < 35) {
						tierchen[i].direction.x *= -1;
						tierchen[i].direction.y *= -1; 
					}
				}
			}
		} 
	}

	void display() {
		fill(255);
		ellipse(location.x, location.y, input.mix.level () * 1000, input.mix.level () * 1000); 
	}
	
}