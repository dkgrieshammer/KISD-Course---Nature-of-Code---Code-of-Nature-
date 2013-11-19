Ball[] bouncies = new Ball[2];

void setup(){
	size(620, 400, P2D);

	for(int i = 0; i < bouncies.length; i++) {
		bouncies[i] = new Ball(i);
	}
}

void draw(){
	background(0);

	for(int i = 0; i < bouncies.length; i++) {
		bouncies[i].draw();
	}
}