class Lissajous {

	int pointCount;
	int freq = 1;
	float phi = 0;

	Lissajous() {
		pointCount = width;
	}

	void draw() {
		translate(0, height/2);
		beginShape();

		for(int i = 0; i < pointCount; i++) {
			float angle = map(i, 0, pointCount, 0, TWO_PI);
			float y = sin(angle * freq + radians(phi));
			// float y = sin(radians(i));
			y *= 100;
			vertex(i, y);
		}

		endShape();
	}

	void setPhi(float newPhi) {
		this.phi = newPhi;
	}

	void setFreq(int newFreq) {
		this.freq = newFreq;
	}
 
 }