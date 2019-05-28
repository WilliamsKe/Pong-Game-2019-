// Introduction screen value
boolean startGame = false;

// Ball variables
float ballX = 500;
float ballY = 300;
float ballR = 10;

// Ball moving in motion variables
float moveX = 5;
float moveY = 5;

// Paddle variables 
float paddleX1;
float paddleY1 = 50;
float paddleWidth1 = 20;
float paddleHeight1 = 60;
float paddleX2;
float paddleY2 = 50;
float paddleWidth2 = 20;
float paddleHeight2 = 60;

// Score variables
int score1 = 0;
int score2 = 0;

// Control variables
String start = "Press the spacebar to start!";
String paddleCtrl1 = "Left paddle controls: W & S";
String paddleCtrl2 = "Right paddle controls: up & down arrow keys";

// Creating the screen and the paddles set up correctly
void setup() {
  background(66, 69, 65);
  size(1000, 600);
  paddleX1 = 978;
  paddleX2 = 1;
}

// The whole game
void draw() {
  background(66, 69, 65);
  ellipse(ballX, ballY, 20, 20);
  fill(255);
  rect(paddleX1, paddleY1, paddleWidth1, paddleHeight1);
  rect(paddleX2, paddleY2, paddleWidth2, paddleHeight2);
  fill(255);
  // line in the middle
  rect(500, 0, 2, 1200);
  border();
  scoreBoard();

  ballX = ballX + moveX;
  ballY = ballY + moveY;

  // if paddle1 scores
  if (moveRight() > width) {
    scoreBoard();
    score1++;
    ballX = 500;
    ballY = 300;
    ballX += moveX;
    ballY += moveY;
  }  
  // Boolean condition determining if ball and paddle come into contact and switch directions
  if (collision()) {
    moveX = -moveX;
  }

  // If paddle2 scores
  if (moveLeft() < 0) {
    scoreBoard();
    ballX = 500;
    ballY = 300;
    ballX += moveX;
    ballY += moveY;
    moveX = -moveX;
    score2++;
  }

  if (moveBottom() > height) {
    moveY = -moveY;
  }

  if (moveTop() < 0) {
    moveY = -moveY;
  }
}


// Border fix possibiltiy (FIX!)
void border() {
  if (paddleY1 + paddleHeight1 < height || paddleY1 + paddleHeight1 > height) {
    paddleY1 = paddleY1 - 0;
  }
}

// Scoreboard and displaying proper score of the game
void scoreBoard() {
  String s = ""+score1+"  "+ " "+score2;
  fill(255, 255, 255);
  textSize(30);
  text(s, 470, 25);

}

// If the ball and paddle come into contact - William Doane
boolean collision() {
  boolean returnValue = false;
  if ((moveRight() > paddleX1) && (moveLeft() < paddleX1 + paddleWidth1)) {
    if ((moveBottom() > paddleY1) && (moveTop() < paddleY1 + paddleHeight1)) {
      returnValue = true;
    }
  }

  if ((moveRight() > paddleX2) && (moveLeft() < paddleX2 + paddleWidth2)) {
    if ((moveBottom() > paddleY2) && (moveTop() < paddleY2 + paddleHeight2)) {
      returnValue = true;
    }
  }
  return returnValue;
}

float moveLeft() {
  return ballX - ballR;
}

float moveRight() {
  return ballX + ballR;
}

float moveTop() {
  return ballY - ballR;
}

float moveBottom() {
  return ballY + ballR;
}

// Control configurations
void keyPressed() {
  if (key == CODED) {
    if (key == ' ') {
      draw();
    }
    if (keyCode == UP) {
      paddleY1 = paddleY1 - paddleHeight1;
    } else if (keyCode == DOWN) {
      paddleY1 = paddleY1 + paddleHeight1;
    }
  }
  if (key == 'w') {
    paddleY2 = paddleY2 - paddleHeight2;
  }
  if (key == 's') {
    paddleY2 = paddleY2 + paddleHeight2;
  }
}
