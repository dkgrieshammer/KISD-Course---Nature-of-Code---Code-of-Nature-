int num = 50;
float range = 60;

float[] ax = new float[num];
float[] ay = new float[num]; 

wusler mywusler ;
wusler mywusler2;

void setup() 
{
  size(640, 360);
  for(int i = 0; i < num; i++) {
    ax[i] = 100; //width/2
    ay[i] =   40; // height/2;
  }
  frameRate(9);
   mywusler = new wusler();
   mywusler2 = new wusler();
}

void draw() 
{
  background(51);

  // Shift all elements 1 place to the left
  for(int i = 1; i < num; i++) {

    ax[i-1] = ax[i];
    ay[i-1] = ay[i];

  // Put a new value at the end of the array

  }
  ax[num-1] += random(-range, range);
  ay[num-1] += random(-range, range);

  // Constrain all points to the screen
  ax[num-1] = constrain(ax[num-1], 0, width);
  ay[num-1] = constrain(ay[num-1], 0, height);

  // Draw a line connecting the points

  for(int i=1; i<num; i++) {    
    float val = float(i)/num * 104.0;
    stroke(val);

mywusler.display(i);
mywusler2.display(i);

}

}

class wusler {

  wusler() {
  }

  void display(int zahl) {

    if (mousePressed == false) {
      zahl =10;   
    }

    arc(ax[zahl], ay[zahl], random(15, 22), random(15, 22), 0, random(PI, PI+1));
    line(ax[zahl-1], ay[zahl-1], ax[zahl], ay[zahl]);
    arc(ax[zahl-1], ay[zahl-1], random(15, 22), random(15, 22), 0, random(PI, PI+1));
  }

}