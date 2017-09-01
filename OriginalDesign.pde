/*A full moon rises and falls over a desert landscape
as the sky slowly fills with stars.

Emma Blenkinsop 9/1/17*/

//global variables
int moonX = -1*width;
int moonY = height/3;
int starCount;
float blue;

//declaring arrays
float[] starX;
float[] starY;
  
void setup() {
  size(900,600);
  //initializing
  starX = new float[20];
  starY = new float[20];
}

void draw() {
  //sky
  fill(5,0,blue);
  rect(0,0,width,height);
  
  //hills
  fill(118,67,8);
  stroke(108,57,0);
  arc(width, height,width*2,height*3/4,PI,2*PI);
  arc(0, height,width*2,height*3/4,PI,2*PI);
  
  star();
  
  //draw stars
  fill(246,255,107);
  for (int i = 0; i<20; i++) {
    ellipse(starX[i] - width/40, starY[i] - width/40, width/40, width/40);
  }
  
  moon();
  
}

void moon() {
  if (moonX < 2*width) {
      fill(230,250,250);
      ellipse(moonX,moonY,width/8,width/8);
      moonX = moonX+1;
      
      //rises and falls
      if (moonX < width/2) {
        moonY = height/3 - moonX/4;
        blue = moonX*.3;
      } else {
        moonY = height/3 - (width-moonX)/4;
        blue = (width-moonX)*.3;
      }
  } else {
    //starts off-screen
    moonX = 0-width/8;
  }
}

void star() {
  noStroke();
  if (random(10)>9.9 && starCount<19) {
    //fills array with star locations at random intervals
    starCount = starCount+1;
    starX[starCount] = random(0,width);
    starY[starCount] = random(0, height*2/3);
  }
}