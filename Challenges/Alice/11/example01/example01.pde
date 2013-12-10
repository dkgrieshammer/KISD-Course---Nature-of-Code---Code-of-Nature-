// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Wolfram Cellular Automata

// Simple demonstration of a Wolfram 1-dimensional cellular automata
// with the system scrolling by
// Also implements wrap around

CA ca; // An object to describe a Wolfram elementary Cellular Automata

void setup() {
  size(640, 800);
  frameRate(24);
  background(255);
  //int[] ruleset = {0,1,1,1,1,0,1,1}; // Rule 222
  //int[] ruleset = {0,1,1,1,1,1,0,1}; // Rule 190
  //int[] ruleset = {0,1,1,1,1,0,0,0}; // Rule 30
  //int[] ruleset = {0,1,1,1,0,1,1,0}; // Rule 110
 int[] ruleset = {0,1,0,1,1,0,1,0}; // Rule 90;

  ca = new CA(ruleset); // Initialize CA
}

void draw() {
  background(255);
  ca.display(); // Draw the CA
  ca.generate();
}

  void mousePressed() {
  ca.randomize(); 
}

// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Wolfram Cellular Automata

// A class to manage the CA

class CA {

  int generation; // How many generations?
  int[] ruleset; // An array to store the ruleset, for example {0,1,1,0,1,1,0,1}
  int w = 4;
  int[][] matrix; // Store a history of generations in 2D array, not just one

  int cols;
  int rows;

  CA(int[] r) {
    ruleset = r;
    cols = width/w;
    rows = height/w;
    matrix = new int[cols][rows];
    restart();
  }

  // Make a random ruleset
  void randomize() {
    for (int i = 0; i < 8; i++) {
      ruleset[i] = int(random(2));
    }
  }

  // Reset to generation 0
  void restart() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        matrix[i][j] = 0;
      }
    }
    matrix[cols/2][0] = 1; // We arbitrarily start with just the middle cell having a state of "1"
    generation = 0;
  }

  // The process of creating the new generation
  void generate() {

    // For every spot, determine new state by examing current state, and neighbor states
    // Ignore edges that only have one neighor
    for (int i = 0; i < cols; i++) {
      int left = matrix[(i+cols-1)%cols][generation%rows]; // Left neighbor state
      int me = matrix[i][generation%rows]; // Current state
      int right = matrix[(i+1)%cols][generation%rows]; // Right neighbor state
      matrix[i][(generation+1)%rows] = rules(left, me, right); // Compute next generation state based on ruleset
    }
    generation++;

    if (keyPressed) {
      restart();
    }
  }

  // This is the easy part, just draw the cells, fill 255 for '1', fill 0 for '0'
  void display() {
    int offset = generation%rows;

    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        int y = j - offset;
        if (y <= 0) y = rows + y;
        // Only draw if cell state is 1
        if (matrix[i][j] == 1) {
          fill(0);
          noStroke();
          rect(i*w, (y-1)*w, w, w);
        }
      }
    }
  }

  // Implementing the Wolfram rules
  // This is the concise conversion to binary way
  int rules (int a, int b, int c) {
    String s = "" + a + b + c;
    int index = Integer.parseInt(s, 2);
    return ruleset[index];
  }

}