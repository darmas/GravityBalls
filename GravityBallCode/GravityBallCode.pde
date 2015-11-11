//declare arrays
int count=30;
float[] x = new float[count];
float[] y = new float[count];
float[] velX = new float[count];
float[] velY = new float[count];
float[] diam = new float[count];

//gravity is not array, but a variable
int gravity=1;


void setup() {//settins run once
  //set size of canvas
  size(800, 600);
  int i=0;
  while (i<count){//variables have values
    x[i] = random(width);
    y[i] = random(height);
    velX[i] = 5;
    velY[i] = 5;
    diam[i] = 10;
    i++;
}
}

void draw() {//settings run in loop
  //draw background to cover previous frame
  background(0);
  for (int i=0; i<count;i++){//for loop
    //draw ball
    ellipse(x[i], y[i], diam[i], diam[i]);
    //add velocity
    velY[i]+=gravity;//y velocity has gravity 
    x[i] += velX[i];
    y[i] += velY[i];

  //bounce ball if it hits walls
  if (x[i] + diam[i]/2 >= width) {
    velX[i] = -abs(velX[i]);    //if the ball hits the right wall, assign x velocity the negative version of itself
  } else if (x[i] - diam[i]/2 <= 0) {
    velX[i] = abs(velX[i]);     //if the ball hits the left wall, assign x velocity the positive version of itself
  }
  if (y[i] + diam[i]/2 >= height) {
    velY[i] = -abs(velY[i]);
    y[i]=height-diam[i]/2;
  } else if (y[i] - diam[i]/2 <= 0) {
    velY[i] = abs(velY[i]);
  }
  }
}