float x1;
float y1;
float x2;
float y2;

// how long the x and y coordinates move in the current direction
int xDir1 = floor(random(250, 500));
int yDir1 = floor(random(500, 750));
int xDir2 = floor(random(-500, -250));
int yDir2 = floor(random(-750, -500));

// how quickly the x and y coordinates move
// having these be different makes them more likely to create curves
float lineSpeed1 = 1;
float lineSpeed2 = 2;
float lineSpeed3 = 3;
float lineSpeed4 = 4;

int lineColor = 200;

void setup() {
  size(1000, 1000);
  smooth();
  background(255);
  blendMode(MULTIPLY);
  x1 = random(width/2);
  y1 = random(height/2);
  x2 = random(width/2);
  y2 = random(height/2);
}

void draw() {
  //  background(255);
  strokeWeight(1);
  stroke(250);
  
  line(x1, y1, x2, y2);
  
  // update the line coordinates to move in various directions and bounce off the edges of the screen
  if (xDir1 > 0)
    x1+=lineSpeed1;
  else
    x1-=lineSpeed1;
    
  xDir1 = updateDir(xDir1, 1);
  
  // if we've hit the edges, reverse direction
  if (x1 < -50 || x1 > width+50)
  {
    xDir1 *= -1;
    xDir2 *= -1;
  }

  if (xDir2 > 0)
    x2+=lineSpeed3;
  else
    x2-=lineSpeed3;  
  xDir2 = updateDir(xDir2, 2);
  if (x2 < -50 || x2 > width+50)
  {
    xDir2 *= -1;
    xDir1 *= -1;
  }

  if (yDir1 > 0)
    y1+=lineSpeed2;
  else
    y1-=lineSpeed2;
  yDir1 = updateDir(yDir1, 1);
  if (y1 < -50 || y1 > height+50)
  {
    yDir1 *= -1;
    yDir2 *= -1;
  }

  if (yDir2 > 0)
    y2+=lineSpeed4;
  else
    y2-=lineSpeed4;
  yDir2 = updateDir(yDir2, 2);
  if (y2 < -50 || y2 > height+50)
  {
    yDir1 *= -1;
    yDir2 *= -1;
  }
}

int updateDir(int dir, int num)
{
  if (dir > 0)
    dir --;
  else
    dir++;

  if (dir == 0)
  {
    if (num == 1)
      dir = floor(random(250, 750));
    else
      dir = floor(random(-750, -250));
  }
  return dir;
}
