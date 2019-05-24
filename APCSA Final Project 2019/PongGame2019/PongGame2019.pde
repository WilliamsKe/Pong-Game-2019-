float ballX = 500;
float ballY = 300;
float ballR = 10;

float dX = random(3, 5);
float dY = random(3, 5);
float paddleX1;
float paddleY1 = 10;
float paddleW1 = 20;
float paddleH1 = 60;
float paddleX2;
float paddleY2 = 10;
float paddleW2 = 20;
float paddleH2 = 60;
int score1 = 0;
int score2 = 0;
void setup() {
  background(66, 69, 65);
  size(1000, 600);
  paddleX1 = width - 25;
  paddleX2 = 1;
}

void draw() {
  background(0);
  ellipse(ballX, ballY, 2 * ballR, 2 * ballR);

  fill(255, 255, 255);
  rect(paddleX1, paddleY1, paddleW1, paddleH1);
  rect(paddleX2, paddleY2, paddleW2, paddleH2);
  border();
  fill(255, 255, 255);
  rect(500, 0, 2, 1200);
  border();
  display();
  ballX = ballX + dX;
  ballY = ballY + dY;

  // if paddle1 scores
  if (ballRight() > width) {
    display();
    noLoop();
    score1++;
  }  
  // Boolean condition determining if ball and paddle come into contact and switch directions
  if (collision()) {
    dX = -dX;
  }

  // If paddle2 scores
  if (ballLeft() < 0) {
    display();
    dX = -dX;
    noLoop();
  }

  if (ballBottom() > height) {
    dY = -dY;
  }

  if (ballTop() < 0) {
    dY = -dY;
  }
}

void border() {
  if (paddleY1 + paddleH1 < height || paddleY1 + paddleH1 > height) {
    paddleY1 = paddleY1 - 0;
  }
}

int display() {
  String s = ""+score1+"  "+ " "+score2;
  fill(255, 255, 255);
  textSize(30);
  text(s, 470, 25);
  score1++;
  if (ballLeft() < 0) {
    score2++;
  }
  return score1;
}

// If the ball and paddle come into contact
boolean collision() {
  boolean returnValue = false;
  if ((ballRight() > paddleX1) && (ballLeft() < paddleX1 + paddleW1)) {
    if ((ballBottom() > paddleY1) && (ballTop() < paddleY1 + paddleH1)) {
      returnValue = true;
    }
  }

  if ((ballRight() > paddleX2) && (ballLeft() < paddleX2 + paddleW2)) {
    if ((ballBottom() > paddleY2) && (ballTop() < paddleY2 + paddleH2)) {
      returnValue = true;
    }
  }
  return returnValue;
}

float ballLeft() {
  return ballX - ballR;
}

float ballRight() {
  return ballX + ballR;
}

float ballTop() {
  return ballY - ballR;
}

float ballBottom() {
  return ballY + ballR;
}
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      paddleY1 = paddleY1 - paddleH1;
    } else if (keyCode == DOWN) {
      paddleY1 = paddleY1 + paddleH1;
    }
  }

  if (key == 'w') {
    paddleY2 = paddleY2 - paddleH2;
  }
  if (key == 's') {
    paddleY2 = paddleY2 + paddleH2;
  }
}
