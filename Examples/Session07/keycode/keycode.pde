

void setup() {
  size(displayWidth, displayHeight);
  colorMode(HSB, 26);
  noCursor();  
}

void draw() {
  background(color(key & 31, 26, 26));
}
