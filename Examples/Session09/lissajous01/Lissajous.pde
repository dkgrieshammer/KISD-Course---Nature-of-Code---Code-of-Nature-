class Lissajous {

	int pointCount;
	float freqX = 1;
	float freqY = 2;

	float phi = 0;
	float scaler = 200; //scale up size to be visible

	Lissajous() {
		pointCount = width;
	}

	void draw() {
		translate(width/2, height/2);
		beginShape();

		for(int i = 0; i < pointCount; i++) {
			float angle = map(i, 0, pointCount, 0, TWO_PI);
			float y = sin(angle * freqX);
			float x = sin(angle * freqY + radians(phi));
			// float y = sin(radians(i));
			y *= scaler;
			x *= scaler;
			vertex(x, y);
		}

		endShape();

		// this.phi = mouseX;
		this.freqY = mouseX/10;
		this.freqX = mouseY/10;
	}

	void setPhi(float newPhi) {
		this.phi = newPhi;
	}

	void setFreqX(float newFreq) {
		this.freqX = newFreq;
	}
	void setFreqY(float newFreq) {
		this.freqY = newFreq;
	}
 
 }