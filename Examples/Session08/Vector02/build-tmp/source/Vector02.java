import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Vector02 extends PApplet {

Triangle myTriangle;

public void setup(){
	size(1024, 800);
	smooth();
	myTriangle = new Triangle(width/2, height/2);
}

public void draw(){
	background(0);
	myTriangle.draw();
}
class Triangle {

	PVector location;
	PVector velocity;

	float mySize = 10;
	float rot;

	//constructor
	Triangle (int xPos, int yPos) {
		location = new PVector(xPos, yPos);

	}

	//public function
	public void draw() {
		update();
		display();
	}



/* private functions
----------------------------------------------------------------------------- */

	public void update() {
		PVector mousePos = new PVector(mouseX, mouseY);
		PVector direction = PVector.sub(mousePos, location);
		//calculate angle
		rot = direction.heading();

		//calculate size by distance of mouse and Triangle
		mySize = location.dist(mousePos);
		
	}

	public void display() {
		pushMatrix();
		translate(location.x, location.y);
		rotate(rot + PI/2);
		triangle(0, 0, mySize, 2*mySize, -mySize, 2*mySize);
		popMatrix();
	}

}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--stop-color=#cccccc", "Vector02" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
