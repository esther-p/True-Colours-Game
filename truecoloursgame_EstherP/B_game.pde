void game () {
  background(creme);

  //colour text
  textSize(textsize);
  textAlign(CENTER, CENTER);
  fill(colors[randomColor]);
  text(words[randomWord], width/2, height/2.60);

  //cheering
  textSize(20);
  cheer();

  //growing text size
  textsize = textsize + 1;

  //buttons
  tactileRect(100, 425, 275, 100, 10, coffee, caramel); //left
  tactileRect(425, 425, 275, 100, 10, coffee, caramel); //right
  fill(caramel);
  textSize(40);
  text("Match", 237.5, 475);
  text("Don't Match", 562.5, 475);

  // display score;
  textSize(50);
  text(score, 30, 30);

  keyboard();

  // timer
  timer = timer - 2;
  if (timer == 0) {
    mode = GAMEOVER;
    textSize(50);
  }
}

// color puzzle
void colormatch (int randomWord, int randomColor) {
  if (randomWord == randomColor) {
    choice = 1;
  } else {
    if (randomWord != randomColor) {
      choice = 2;
    }
  }
}

void colornotmatch (int randomWord, int randomColor) {
  if (randomWord != randomColor) {
    choice = 1;
  } else {
    if (randomWord == randomColor) {
      choice = 2;
    }
  }
}

// 50/50 chance generator
void random50() {  //true = 0, false = 1
  randomGenerator = (int)random (0, 2);
  randomWord = (int) random(0, 7);
  if (randomGenerator == 0) {
    randomWord = randomColor;
  } else if (randomGenerator == 1) {
    while (randomWord == randomColor) {
      randomColor = (int)random(0, 7);
    }
  }
}

void score () {
  if (choice == 1) {
    score++;
    scoresound.rewind();
    scoresound.play();
  } else {
    mode = GAMEOVER;
  }
}


void resetcolor() {
  randomColor = (int) random(0, 7);
  random50();
  timer = 200;
  textsize = 70;
}

// keyboard
void keyboard() {
  if (leftkey == true) {
    colormatch(randomWord, randomColor);
    score();
    resetcolor();
    leftkey = false;
  } else if (rightkey == true) {
    colornotmatch(randomWord, randomColor);
    score();
    resetcolor();
    rightkey = false;
  }
}

void gameClicks() {
  if (mousetouchingRect(100, 425, 275, 100)) {
    colormatch(randomWord, randomColor);
    score();
    resetcolor();
  } else if (mousetouchingRect(425, 425, 275, 100)) {
    colornotmatch(randomWord, randomColor);
    score();
    resetcolor();
  }
}


void cheer() {
  if (score != 0 && score%10 == 0) {
    textSize(20);
    text("Congrats, you scored "+score+" points! keep going!", 585, 25);
    image(gif2[f2], 700, 90, 170, 170);
    if (frameCount % 10 == 0) {
      f2 = f2 + 1;
    }
    if (f2 == numberOfFrames2) f2 = 0;
  }
}
