import processing.video.*;

Sensor cameraSensor;
Countdown lightCountdown;

Capture video;

int mode = 0;
float brightestValue = 0; // Brightness of the brightest video pixel
float gameTime, startTime;

void setup() {
  size(640, 480);
  textSize(18);
  cameraSensor = new Sensor();
  lightCountdown = new Countdown();
  // Uses the default video input, see the reference if this causes an error
  video = new Capture(this, width, height);
  video.start();

}

void draw() {

  if(brightestValue == 254){
      startTime = millis();
  }  

  cameraSensor.update();

  lightCountdown.check(250); 

  lightCountdown.count(); 

}

class Countdown{

  void check(int br){

    if(brightestValue > br) {
      rect(0, 0, width, height);
      fill(255);
      video.stop();
      mode = 1;
    }

    if(brightestValue < br) {
      fill(0);
      rect(0, 0, width, height);
    }

  }

  void count(){

    background(255);
    fill(50);
    println(startTime);

    if(gameTime >= 30.0){
        text("BLAST OFF",275,200);
  //      image(blast,6,64);
    }
    else{
        text(int (30-gameTime), 200,200);
    }

    if(mode == 1){
      gameTime = (millis()-startTime)/1000;
    }

  }

}

class Sensor{

  void update(){

    if (video.available()) {
    video.read();
    image(video, 0, 0, width, height); // Draw the webcam video onto the screen
    int brightestX = 0; // X-coordinate of the brightest video pixel
    int brightestY = 0; // Y-coordinate of the brightest video pixel
    // Search for the brightest pixel: For each row of pixels in the video image and
    // for each pixel in the yth row, compute each pixel's index in the video
    video.loadPixels();
    int index = 0;
      for (int y = 0; y < video.height; y++) {
        for (int x = 0; x < video.width; x++) {
          // Get the color stored in the pixel
          int pixelValue = video.pixels[index];
          // Determine the brightness of the pixel
          float pixelBrightness = brightness(pixelValue);
          // If that value is brighter than any previous, then store the
          // brightness of that pixel, as well as its (x,y) location
          if (pixelBrightness > brightestValue) {
            brightestValue = pixelBrightness;
            brightestY = y;
            brightestX = x;
          }
          index++;
        }
      }

      print(brightestValue);

    }

  }

}