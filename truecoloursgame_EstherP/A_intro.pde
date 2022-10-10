void intro() {
  // audio
  gameover.pause();
  gameover.rewind();
  intro.play();

  //background
  background(lightmatcha);
  imageMode(CENTER);
  image(cloud, 400, 190, 600, 300);

  //title
  textFont(bubblefont);
  fill(matcha);
  textSize(80);
  text("True Colours", width/2, 210);
  textSize(50);

  //gif
  image(gif[f], 550, 110, 150, 150);
  if (frameCount % 7 == 0) {
    f = f +1;
  }
  if (f == numberOfFrames) f = 0;

  image(cloud, 550, 165, 200, 70); // cloud 

  // start button
  tactileRect(275, 400, 250, 100, 20, creme, matcha);
  fill(matcha);
  text("Start", width/2, height/2+145);
}

void introClicks() {
  if (mousetouchingRect(275, 400, 250, 100)) {
    mode = GAME;
  }
}
