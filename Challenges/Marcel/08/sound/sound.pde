

import ddf.minim.*;

Minim minim;
AudioInput input;
int amcount = 23;
PVector direction;
Amoebe[] tierchen = new Amoebe[50];

void setup() {
	size(800, 600);

	for (int i = 0; i<50; i++) {
		tierchen[i] = new Amoebe(50);
	} 

	noStroke();
	fill(200, 100, 80);
	minim = new Minim (this);
	input = minim.getLineIn (Minim.STEREO, 512);
}

void draw() {
	background(0);
	
	for (int i = 0; i < tierchen.length; i++) {
		tierchen[i].move();
	}
}