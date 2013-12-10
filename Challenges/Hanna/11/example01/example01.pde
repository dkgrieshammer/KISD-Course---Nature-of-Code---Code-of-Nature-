amoebe amoebe1;

void setup () {

size(640, 400, P2D);
smooth(8);
amoebe1 = new amoebe(50);
}
void draw () {
background(222, 32, 21);

amoebe1.move();

}
class amoebe {

float xPos;
float yPos;
int mySize;

amoebe (int Size) {
mySize = Size;
xPos= (200);
yPos= (300);
}

void move() {
ellipse (xPos, yPos, mySize, mySize);
fill(23, 123, 234);

// If the cursor is over the amoebe, change the position
if (abs(mouseX - xPos)<mySize &&
    abs(mouseY - yPos)<mySize) {
    xPos += random(-5, 5);
    yPos += random(-5, 5);
      }
}
}
