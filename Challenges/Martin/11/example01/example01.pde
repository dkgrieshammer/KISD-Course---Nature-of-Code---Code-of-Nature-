// Sketch 32 - Useing for loops

color [] grid = {
  #d9c6b0, #791f33, #FDF6DD, #45718c, #b6e1f2
};
color [] palette = grid;

// global variables

int s = 50;

void setup() {

  size(600, 200);
  smooth();
  stroke(palette[0]);  
  noStroke();
  frameRate(20);

  for (int x = 0; x < width; x += s) {

    for (int y = 0; y < height; y += s) {
      fill(palette[int(random(1, 5))]);
      rect(x, y, s, s);
    }
  }
}

void draw() {

  fill(palette[int(random(1, 5))]);
  int x = int (random(width/s))*s;
  int y = int (random(height/s))*s;
  rect(x, y, s, s);
}