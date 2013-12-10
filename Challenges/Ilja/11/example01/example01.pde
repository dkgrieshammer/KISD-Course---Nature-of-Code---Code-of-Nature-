float i=0;
float rotation;

void setup() {
size(900, 900);
background(0);
stroke(50, 100, 200, 5);
frameRate(120);
colorMode(HSB);
}

void draw() {
rotation=mouseX/50;
if (frameCount<50000) {
translate(width/2, height/2);
strokeWeight(frameCount/64);
rotate(radians(frameCount*(10+rotation)));
stroke(map(radians(frameCount*26)%(2*PI), 0, 2*PI, 0, 255), 255, 255, 5);
i+=0.01;
line(i, 0, i+20, i);

if (frameCount%500 == 0) saveFrame("background-######.png");
}
}