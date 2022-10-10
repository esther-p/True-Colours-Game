void gameover () {
  background(greyblue);
  highscore();
  gameover.play();

  // return menu button
  tactileRect(100, 485, 275, 70, 10, lightblue, darkgreyblue); //left
  tactileRect(425, 485, 275, 70, 10, lightblue, darkgreyblue);
  fill(darkgreyblue);
  text("Menu", 237.5, 520);
  text("Exit", 562.5, 520);

  // gameover display
  textSize(70);
  fill(darkgreyblue);
  text("Gameover", width/2, 60);

  //score board
  fill(creme);
  rect(105, 150, 255, 285);
  image(scoreboard, 230, 280, 550, 450); // image scoreboard
  fill(darkgreyblue);
  textSize(40);
  text("Score: "+score, width/3.35, 220); //score display
  text("Best: "+highscore, width/3.4, 300); //best display
}

void highscore() {
  if (score > highscore) {
    gamelost = !gamelost;
    highscore=score;
    text(score, width/4, 400);
  }

  if (!gamelost) {
    image(gif3[f3], 580, 280, 300, 200); // beat highscore display
    if (frameCount % 5 == 0) {
      f3 = f3 + 1;
    }
    if (f3 == numberOfFrames3) f3 = 0;
  } else {
    image(gif4[f4], 580, 300, 200, 200); // didn't beat highscore display
    if (frameCount % 4 == 0) {
      f4 = f4 + 1;
    }
    if (f4 == numberOfFrames4) f4= 0;
  }
}

void gameoverClicks() {
  if (mousetouchingRect(100, 485, 275, 70)) {
    mode = INTRO;
    reset();
  }
  if (mousetouchingRect(425, 485, 275, 70)) {
    exit();
  }
}
