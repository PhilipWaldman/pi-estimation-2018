int inCircle=0;
int totalPoints=0;

void setup() {
  size(750, 500);
  noStroke();
  frameRate(1000);
  drawCircle();
}

void draw() {
  makePoint();

  if (totalPoints%100==0) {
    noStroke();
    fill(100);
    rect(height, 0, width, height);

    textSize(20);
    fill(255);
    text("Total: "+totalPoints, height+10, 20);
    text("In Circle: "+inCircle, height+10, 40);
    float estimate = (float)inCircle/totalPoints*4;
    text("Pi Estimate: "+estimate, height+10, 60);
    text("Actual Pi: "+PI, height+10, 80);
    float error = abs(PI-estimate)/PI*100;
    text("% Error: "+error, height+10, 100);

    //saveFrame("frames/####.png");
  }

  if (totalPoints%5000==0)
    drawCircle();
}

void keyPressed() {
  for (int i=0; i<10000; i++) {
    makePoint();
    if (i%10000==0)
      println(i);
  }

  noStroke();
  fill(100);
  rect(height, 0, width, height);

  textSize(20);
  fill(255);
  text("Total: "+totalPoints, height+10, 20);
  text("In Circle: "+inCircle, height+10, 40);
  float estimate = (float)inCircle/totalPoints*4;
  text("Pi Estimate: "+estimate, height+10, 60);
  text("Actual Pi: "+PI, height+10, 80);
  float error = abs(PI-estimate)/PI*100;
  text("% Error: "+error, height+10, 100);
  
  if(key == 's')
    saveFrame("pi-2018.png");
}

void makePoint() {
  strokeWeight(5);
  float x = random(height+1);
  float y = random(height+1);
  if (dist(0, height, x, y) <= height) {
    inCircle++;
    stroke(0, 200, 0);
  } else
    stroke(200, 0, 0);
  totalPoints++;
  point(x, y);
}

void drawCircle() {
  background(100);

  strokeWeight(4);
  stroke(0);
  fill(200);
  ellipse(0, height, 2*height, 2*height);
}
