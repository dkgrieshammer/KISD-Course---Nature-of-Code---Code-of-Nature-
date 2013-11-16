
Ball myBall;

void setup(){
	size(1024, 800, OPENGL);
	myBall = new Ball(width/2, height/2);
}

void draw(){
	background(0);
	myBall.draw();
}