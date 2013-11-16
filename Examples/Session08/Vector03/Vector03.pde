Triangle[] myTriangles = new Triangle[80];

// calculating raster to position Triangles evenly
float xRaster;
float yRaster;

void setup(){
	size(1024, 800);
	smooth();
	xRaster = width/10;
	yRaster = height/8;

	for(int i = 0; i < 10; i++) {
		for(int j = 0; j < 8; j++) {
			int tmp = (j * 10 + i);
			println(i * 10 + j);
			myTriangles[tmp] = new Triangle(xRaster * i + 40, yRaster * j + 40);
		}
	}
}

void draw(){
	background(0);
	// translate(40, 40); //move canvas a little to see all triangles

	for(int i = 0; i < myTriangles.length; i++) {
		myTriangles[i].draw();
	}

}